#!/usr/bin/env bash

if [ $ENVIRONMENT == "prod" ]
then
    export KUBE_TOKEN=${PROD_KUBE_TOKEN}
fi

cd kd
kd --insecure-skip-tls-verify \
   --file deployment.yaml \
   --file service.yaml
