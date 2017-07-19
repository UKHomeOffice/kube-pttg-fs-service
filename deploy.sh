#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export APP=pttg-fs-service
export KUBE_SERVER=${KUBE_SERVER_DEV}
export KUBE_TOKEN=${KUBE_TOKEN}

echo "Diagnosing .. got into the deploy.sh script"

cd kd
kd --debug \
   --insecure-skip-tls-verify  --timeout 5m0s \
   --file ${ENVIRONMENT}/pttg-fs-service-deployment.yaml \
   --file ${ENVIRONMENT}/pttg-fs-service-svc.yaml