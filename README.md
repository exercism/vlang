# Exercism V Track

[![Configlet](https://github.com/exercism/vlang/actions/workflows/configlet.yml/badge.svg?branch=main)](https://github.com/exercism/vlang/actions/workflows/configlet.yml) [![V / Test](https://github.com/exercism/vlang/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/exercism/vlang/actions/workflows/test.yml)

Exercism exercises in V.

## Testing

To test the exercises, run `./bin/test`.
This command will iterate over all exercises and check to see if their example implementation passes all the tests.

### Track linting

[`configlet`](https://exercism.org/docs/building/configlet) is an Exercism-wide tool for working with tracks. You can download it by running:

```shell
$ ./bin/fetch-configlet
```

Run its [`lint` command](https://exercism.org/docs/building/configlet/lint) to verify if all exercises have all the necessary files and if config files are correct:

```shell
$ ./bin/configlet lint

The lint command is under development.
Please re-run this command regularly to see if your track passes the latest linting rules.

Basic linting finished successfully:
- config.json exists and is valid JSON
- config.json has these valid fields:
    language, slug, active, blurb, version, status, online_editor, key_features, tags
- Every concept has the required .md files
- Every concept has a valid links.json file
- Every concept has a valid .meta/config.json file
- Every concept exercise has the required .md files
- Every concept exercise has a valid .meta/config.json file
- Every practice exercise has the required .md files
- Every practice exercise has a valid .meta/config.json file
- Required track docs are present
- Required shared exercise docs are present
```


## Contributing

### General Information (useful for all contributions)

#### Setting up V

See [INSTALLATION.md](./docs/INSTALLATION.md)

#### Style Guide:

Before committing, please run `v fmt -w [FILE_NAME]` on whatever file you're committing to ensure it is formatted properly. More info on V formatting can be found [in the docs](https://github.com/vlang/v/blob/master/doc/docs.md#v-fmt)

#### In the comments section anywhere

Use [conventional comments](https://conventionalcomments.org/)

### Issues

Opening new issues is highly encouraged! To make the process as smooth as possible, please include as much information as possible about the issue. Better to have more information than not enough.

### Pull requests

- Please use [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
- If your PR is related to or fixes an open issue, please reference the issue number in the PR title. [Here's an example](https://github.com/exercism/vlang/pull/37).

#### How to get started contributing

A good place to start in the docs is to understand how the [Hello World](https://exercism.org/docs/building/tracks/new/add-first-exercise) exercise is created. Make sure you've fetched configlet!

#### How to implement a new exercise from start to finish

1. Pick an exercise from the [problem-specifications](https://github.com/exercism/problem-specifications/tree/main/exercises) repo.
2. Create a new entry for the exercise in [config.json](./config.json). Include
  - a new UUID for the exercise (generated with `bin/configlet uuid`)
  - the slug of the exercise (should be the same as in [problem-specifications](https://github.com/exercism/problem-specifications/tree/main/exercises))
  - the name of the exercise (should be the same as in [problem-specifications](https://github.com/exercism/problem-specifications/tree/main/exercises))
  - any concepts it practices and prereqs it has (safe to leave blank usually!)
  - your best estimate of how difficult the task is
3. Create the directory for the exercise and download shared files using these two commands:
  - `bin/configlet sync --update --yes --docs --metadata --exercise [SLUG]`
  - `bin/configlet sync --update --tests include --exercise [SLUG]`
4. Create 3 files in the new directory (located at `exercises/practice/[SLUG]`):
  - `run_test.v`
  - `[SLUG].v`
  - `.meta/example.v`
5. Write an example implementation in `[SLUG].v`
6. Write a test suite in `run_test.v` based on the canonical data in [problem-specifications](https://github.com/exercism/problem-specifications/tree/main/exercises). Here's an example of [canonical data](https://github.com/exercism/problem-specifications/blob/main/exercises/grade-school/canonical-data.json) and here's the [corresponding test suite](./exercises/practice/grade-school/run_test.v).
7. Run the test suite with `v -stats test run_test.v`
8. Once all tests pass, make sure code is formatted properly with `v fmt -w [V_FILE]` on all the v files (example and test files)
9. Copypaste everything in `[SLUG].v` into `.meta/example.v`
10. Remove everything from `[SLUG].v` except the stub of the needed function, the `module main` at the top, and make a stub of a struct or two.
11. Commit changes with [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
12. Make your PR and do a little happy dance

![](https://media3.giphy.com/media/ghVtt3BfMwYhi/giphy.gif?cid=790b7611a39608242e7ad1acf94c07788cdcada74ca02528&rid=giphy.gif&ct=g)


## Decision Records
(putting these here for now until someone tells me a better place or I find a better place)

### How to handle module naming
See solution #3 in (this excellent repo](https://github.com/petertseng/exercism-v#readme)

### Name of sample solutions
`example.v`

### Name of testing script for each solution
`run_test.v`

["All test functions have to be inside a test file whose name ends in _test.v."](https://github.com/vlang/v/blob/master/doc/docs.md#test-files)
