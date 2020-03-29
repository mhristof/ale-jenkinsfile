# ale-jenkinsfile

[ALE](https://github.com/dense-analysis/ale) linter for Jenkinsfile.

## Prerequisites

* [ALE](https://github.com/dense-analysis/ale)
* docker, this plugin spins up a [mhristof/jenkins](https://hub.docker.com/repository/docker/mhristof/jenkins)
container to do its linting.

## Installation

From your terminal run:

```
curl -sL https://raw.githubusercontent.com/mhristof/ale-jenkinsfile/master/ale_jenkinsfile.vim > ~/.vim/path/to/your/ale/installation/ale_linters/groovy/ale_jenkinsfile.vim
```

