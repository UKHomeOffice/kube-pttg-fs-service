#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export APP=pttg-fs-api
export KUBE_SERVER=${KUBE_SERVER_PROD}
export KUBE_TOKEN=${KUBE_TOKEN_PROD}

cd kd
kd --insecure-skip-tls-verify  --timeout 5m0s \
   --file ${ENVIRONMENT}/pttg-fs-api-deployment.yaml \
   --file ${ENVIRONMENT}/pttg-fs-api-svc.yaml