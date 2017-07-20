#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE:-${DRONE_DEPLOY_TO}}
export ENVIRONMENT=${ENVIRONMENT:-dev}
export APP=${APP:-pttg-fs-service}
export KUBE_SERVER=${KUBE_SERVER_DEV}
export KUBE_TOKEN=${KUBE_TOKEN}

cd kd

kd --insecure-skip-tls-verify \
   --file ${APP}-deployment.yaml \
   --file ${APP}-svc.yaml
