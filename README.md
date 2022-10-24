# Exercism V Track

[![configlet](https://github.com/exercism/vlang/workflows/configlet/badge.svg)](https://github.com/exercism/vlang/actions?query=workflow%3Aconfiglet) [![tests](https://github.com/exercism/vlang/workflows/test/badge.svg)](https://github.com/exercism/vlang/actions?query=workflow%3Atest)

Exercism exercises in V.

## Testing

To test the exercises, run `./bin/test`.
This command will iterate over all exercises and check to see if their exemplar/example implementation passes all the tests.

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


## Decision Records
(putting these here for now until someone tells me a better place or I find a better place)

### How to handle module naming
See solution #3 in (this excellent repo](https://github.com/petertseng/exercism-v#readme)

### Name of sample solutions
`example.v`

### Name of testing script for each solution
`run_test.v`

["All test functions have to be inside a test file whose name ends in _test.v."](https://github.com/vlang/v/blob/master/doc/docs.md#test-files)
