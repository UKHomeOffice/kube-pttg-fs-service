#!/bin/bash

export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export KUBE_SERVER=${KUBE_SERVER}

if [ ${ENVIRONMENT} == "prod" ] ; then
    echo "deploy to prod namespace, using PTTG_FS_PROD drone secret"
    export KUBE_TOKEN=${PTTG_FS_PROD}
else
    if [ ${ENVIRONMENT} == "test" ] ; then
        echo "deploy to test namespace, using PTTG_FS_TEST drone secret"
        export KUBE_TOKEN=${PTTG_FS_TEST}
    else
        echo "deploy to dev namespace, using PTTG_FS_DEV drone secret"
        export KUBE_TOKEN=${PTTG_FS_DEV}
    fi
fi

cd kd

kd --insecure-skip-tls-verify \
    -f networkPolicy.yaml \
    -f deployment.yaml \
    -f service.yaml
