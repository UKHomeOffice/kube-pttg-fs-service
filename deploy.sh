#!/bin/bash

export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export KUBE_SERVER=${KUBE_SERVER}

if [ ${ENVIRONMENT} == "prod" ] ; then
    export KUBE_TOKEN=${PTTG_FS_PROD}
else
    if [ ${ENVIRONMENT} == "test" ] ; then
        export KUBE_TOKEN=${PTTG_FS_TEST}
    else
        export KUBE_TOKEN=${PTTG_FS_DEV}
    fi
fi

cd kd

kd --insecure-skip-tls-verify \
    -f networkPolicy.yaml \
    -f deployment.yaml \
    -f service.yaml
