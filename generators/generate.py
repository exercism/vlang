#!/usr/bin/env -S python3 -B
"""Generate the unit tests of practice exercises from canonical data."""

import argparse
import importlib.util
import json
import pathlib
import subprocess
import sys
import tomllib
from types import ModuleType
from typing import Any

import lib

ROOT = pathlib.Path(__file__).resolve().parent.parent
EXERCISES = ROOT / "exercises" / "practice"
CACHE_PREFIX = "Using cached 'problem-specifications' dir: "
ADDITIONAL_CASES = "additional-test-cases.json"

Case = dict[str, Any]

# Avoid leaving __pycache__ in the exercise directories.
sys.dont_write_bytecode = True


def problem_specifications_dir() -> pathlib.Path:
    """Locate configlet's cached copy of problem-specifications."""
    configlet = ROOT / "bin" / "configlet"
    if not configlet.exists():
        raise FileNotFoundError("bin/configlet not found; run bin/fetch-configlet")
    output = subprocess.check_output(
        [configlet, "info", "-o", "-v", "d"], cwd=ROOT, text=True
    )
    for line in output.splitlines():
        if line.startswith(CACHE_PREFIX):
            path = pathlib.Path(line.removeprefix(CACHE_PREFIX).strip())
            if path.is_dir():
                return path
    raise FileNotFoundError(
        "problem-specifications cache not found; run bin/configlet sync"
    )


def flatten(cases: list[Case], parents: list[str] | None = None) -> list[Case]:
    """Flatten nested groups, recording the descriptions of enclosing groups."""
    flattened = []
    if parents is None:
        parents = []
    for case in cases:
        if "cases" in case:
            description = case.get("description")
            nested = parents + [description] if description else parents
            flattened.extend(flatten(case["cases"], nested))
        else:
            flattened.append({**case, "parents": parents})
    return flattened


def canonical_cases(
    slug: str, specifications: pathlib.Path, exercise_dir: pathlib.Path
) -> list[Case]:
    """Load the canonical cases selected by the exercise's tests.toml."""
    data_path = specifications / "exercises" / slug / "canonical-data.json"
    if not data_path.exists():
        return []
    cases = flatten(json.loads(data_path.read_text(encoding="utf-8"))["cases"])

    toml_path = exercise_dir / ".meta" / "tests.toml"
    tests = tomllib.loads(toml_path.read_text(encoding="utf-8"))

    selected = []
    for case in cases:
        uuid = case["uuid"]
        if uuid not in tests:
            print(
                f"warning: {slug}: {uuid} ({case['description']}) "
                "is missing from tests.toml; skipped",
                file=sys.stderr,
            )
        elif tests[uuid].get("include", True):
            selected.append(case)
    return selected


def additional_cases(exercise_dir: pathlib.Path) -> list[Case]:
    """Load the track-specific cases of an exercise, if it has any."""
    path = exercise_dir / ".meta" / ADDITIONAL_CASES
    if not path.exists():
        return []
    return flatten(json.loads(path.read_text(encoding="utf-8")))


def generator_path(slug: str) -> pathlib.Path:
    return EXERCISES / slug / ".meta" / "test_generator.py"


def load_module(slug: str) -> ModuleType:
    path = generator_path(slug)
    if not path.exists():
        raise FileNotFoundError(
            f"no generator for {slug}; expected {path.relative_to(ROOT)}"
        )
    spec = importlib.util.spec_from_file_location(path.stem, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def render_case(module: ModuleType, case: Case) -> str:
    """Render one case as a test function."""
    name = getattr(module, "test_name", lib.test_name)(case)
    body = module.gen_case(case)
    if not isinstance(body, str):
        body = "\n".join(body)
    return f"fn test_{name}() {{\n{lib.indent(body)}\n}}"


def render_tests(module: ModuleType, cases: list[Case]) -> str:
    """Render the test file."""
    sections = ["module main"]
    header = getattr(module, "HEADER", None)
    if header:
        sections.append(header.strip("\n"))
    sections.extend(render_case(module, case) for case in cases)
    return "\n\n".join(sections).replace(lib.NO_INDENT, "") + "\n"


def generate(slug: str, specifications: pathlib.Path) -> None:
    exercise_dir = EXERCISES / slug
    module = load_module(slug)

    cases = canonical_cases(slug, specifications, exercise_dir)
    cases.extend(additional_cases(exercise_dir))
    if hasattr(module, "sort_key"):
        cases.sort(key=module.sort_key)
    if not cases:
        print(f"warning: {slug}: no test cases found; skipped", file=sys.stderr)
        return

    config = json.loads((exercise_dir / ".meta" / "config.json").read_text())
    path = exercise_dir / config["files"]["test"][0]
    path.write_text(render_tests(module, cases), encoding="utf-8", newline="\n")


def generated_slugs() -> list[str]:
    return sorted(
        path.name for path in EXERCISES.iterdir() if generator_path(path.name).exists()
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("slugs", nargs="*", metavar="slug", help="exercise slug")
    parser.add_argument(
        "--all",
        action="store_true",
        help="generate every exercise that has a generator",
    )
    args = parser.parse_args()
    if args.all == bool(args.slugs):
        parser.error("specify either exercise slugs or --all")

    slugs = generated_slugs() if args.all else args.slugs
    try:
        specifications = problem_specifications_dir()
        for slug in slugs:
            generate(slug, specifications)
    except (FileNotFoundError, subprocess.CalledProcessError) as error:
        sys.exit(f"error: {error}")


if __name__ == "__main__":
    main()
