"""Helpers for rendering canonical data values as V source code."""

import re
import textwrap
from collections.abc import Callable, Iterable
from typing import Any

INDENT = "\t"
NO_INDENT = "\0"

_ESCAPES = {
    "\\": "\\\\",
    "\n": "\\n",
    "\r": "\\r",
    "\t": "\\t",
    "\0": "\\0",
}


def test_name(case: dict[str, Any]) -> str:
    """Render the description of a case as the suffix of a test function name."""
    return snake_case(case["description"])


def nested_test_name(case: dict[str, Any]) -> str:
    """Render a test function name that includes the enclosing groups."""
    return "__".join(
        snake_case(text) for text in (*case["parents"], case["description"])
    )


def dashed_test_name(case: dict[str, Any]) -> str:
    """Render a test function name where each dash becomes an extra underscore."""
    text = _negative_numbers(case["description"]).lower().replace("-", "_")
    words = [re.sub(r"[^a-z0-9_]", "", word) for word in text.split()]
    return "_".join(word for word in words if word)


def snake_case(text: str) -> str:
    """Render text as a lower case identifier."""
    text = _negative_numbers(text).replace("'", "")
    return re.sub(r"[^a-z0-9]+", "_", text.lower()).strip("_")


def _negative_numbers(text: str) -> str:
    """Spell out minus signs, so that "is -4" and "is 4" give different names."""
    return re.sub(r"-(?=\d)", "negative ", text)


def v_string(value: str) -> str:
    """Render a string as a V string literal, as formatted by v fmt."""
    quote = '"' if "'" in value and '"' not in value else "'"
    chars = []
    for index, char in enumerate(value):
        if char in _ESCAPES:
            chars.append(_ESCAPES[char])
        elif char == "$" and re.match(r"[{A-Za-z_]", value[index + 1 :]):
            chars.append("\\$")
        elif char == quote:
            chars.append("\\" + char)
        elif not char.isprintable():
            chars.append(f"\\u{ord(char):04x}")
        else:
            chars.append(char)
    return quote + "".join(chars) + quote


def v_text(lines: Iterable[str]) -> str:
    """Render lines of text as a parenthesised string, one line of text per line."""
    text = "\n".join(lines)
    quote = '"' if "'" in text and '"' not in text else "'"
    return f"({quote}{text}{quote})".replace("\n", "\n" + NO_INDENT)


def v_int(value: int) -> str:
    """Render an integer as a V integer literal."""
    return str(value)


def v_float(value: float) -> str:
    """Render a number as a V floating point literal."""
    return str(float(value))


def v_bool(value: bool) -> str:
    """Render a boolean as a V boolean literal."""
    return "true" if value else "false"


def v_value(value: Any) -> str:
    """Render a boolean, integer, float, string or list."""
    if isinstance(value, bool):
        return v_bool(value)
    if isinstance(value, int):
        return v_int(value)
    if isinstance(value, float):
        return v_float(value)
    if isinstance(value, str):
        return v_string(value)
    return v_inline_array(value, v_value)


def v_array(
    values: Iterable[Any], render: Callable[[Any], str] = v_value, empty: str = "[]"
) -> str:
    """Render an array literal with one element per line."""
    lines = [f"{INDENT}{render(value)}," for value in values]
    if not lines:
        return empty
    return "\n".join(["[", *lines, "]"])


def v_inline_array(
    values: Iterable[Any], render: Callable[[Any], str] = v_value, empty: str = "[]"
) -> str:
    """Render an array literal on a single line."""
    items = [render(value) for value in values]
    if not items:
        return empty
    return "[" + ", ".join(items) + "]"


def is_error(expected: Any) -> bool:
    """Report whether a canonical expected value describes an error."""
    return isinstance(expected, dict) and "error" in expected


def indent(text: str, levels: int = 1) -> str:
    """Indent every non-empty line of text, except within multi-line strings."""
    return textwrap.indent(
        text, INDENT * levels, lambda line: line.strip() and line[0] != NO_INDENT
    )


def assert_true(expression: str) -> str:
    """Assert that an expression holds."""
    return f"assert {expression}"


def assert_false(expression: str) -> str:
    """Assert that an expression does not hold."""
    return f"assert !{expression}"


def assert_eq(actual: str, expected: str) -> str:
    """Assert that two expressions are equal."""
    return f"assert {actual} == {expected}"


def assert_error(
    call: str,
    case: dict[str, Any],
    subject: str | None = None,
    binding: str = "res",
    *,
    check_message: bool = True,
) -> str:
    """Assert that a call returns an error, by default with the expected message.

    With check_message=False, any error (or none) is accepted.
    """
    if subject is None:
        subject = case["description"]
    if check_message:
        check = f"assert err.msg() == {v_string(case['expected']['error'])}"
    else:
        check = "assert true"
    return _assert_fails(call, f"{subject} should return an error", check, binding)


def assert_none(call: str, failure: str, binding: str = "_") -> str:
    """Assert that a call returns none."""
    return _assert_fails(call, failure, "assert true", binding)


def assert_some(call: str, expected: str, failure: str, binding: str = "res") -> str:
    """Assert that a call returns a value, rather than none or an error."""
    return "\n".join(
        [
            f"if {binding} := {call} {{",
            f"{INDENT}{assert_eq(binding, expected)}",
            "} else {",
            f"{INDENT}assert false, {v_string(failure)}",
            "}",
        ]
    )


def assert_ok(call: str, failure: str) -> str:
    """Assert that a call does not return an error, discarding any value."""
    return f"{call} or {{ assert false, {v_string(failure)} }}"


def _assert_fails(call: str, failure: str, check: str, binding: str) -> str:
    return "\n".join(
        [
            f"if {binding} := {call} {{",
            f"{INDENT}assert false, {v_string(failure)}",
            "} else {",
            f"{INDENT}{check}",
            "}",
        ]
    )
