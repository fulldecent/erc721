# Contributing

## Issues

We use GitHub issues to track public bugs. Please ensure your description is clear and has sufficient instructions to be able to reproduce the issue.

## Pull requests

* Fork the repo and create your branch from main.
* If you've added code that should be tested, add tests.
* Ensure the test suite passes.

## Coding style

The full style guide is the [0xcert Solidity style guide](https://github.com/0xcert/solidity-style-guide).

## Release process

The release manager is responsible to follow the process for each release of this project.

Summarize the changes and create a release using [GitHub releases](https://github.com/fulldecent/erc721/releases). Note that only major releases are required to be fully documented.

```sh
npm i
npm test
npm publish
```

Note: item 1 may become automated at some point and put into the continuous integration build.
