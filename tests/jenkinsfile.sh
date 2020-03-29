#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

for (( i = 0; i < 10; i++ )); do
    if docker logs $(< .id) 2>&1 | grep 'Jenkins is fully up and running'; then
        break
    fi
    echo 'Waiting for jenkins'
    sleep 4
done

if [[ $i == 10 ]]; then
    echo 'Error, jenkins was not up and running'
    exit 1
fi

curl --silent -X POST -F "jenkinsfile=<tests/fixtures/Jenkinsfile.good" localhost:8080/pipeline-model-converter/validate
! curl --silent -X POST -F "jenkinsfile=<tests/fixtures/Jenkinsfile.bad" localhost:8080/pipeline-model-converter/validate

exit 0
