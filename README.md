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


## Special thanks

creating the jenkins container - https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/
linting jenkinsfiles - https://jenkins.io/doc/book/pipeline/development/#linter
where to place a custom ALE linter file - https://github.com/dense-analysis/ale/issues/1405#issuecomment-371119938
how do i define a custom ALE linter - https://github.com/dense-analysis/ale/issues/391
