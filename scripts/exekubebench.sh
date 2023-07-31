
echo -e "NAMESPACE is ${NAMESPACE}"
echo -e "LOCATION is ${LOCATION}"
echo -e "PROJECT is ${PROJECT}"
echo -e "CLUSTER is ${CLUSTER}"


gcloud container clusters get-credentials ${CLUSTER} --zone ${LOCATION} --project ${PROJECT}

kubectl create ns ${NAMESPACE}
kubectl apply -f k8/kube-bench.yaml -n ${NAMESPACE}

## Installation will spin up the following
  # 1. Kube-bench scheduler
  # 2. Kube-bench pods



## Verify the instllation by checks the pods/jobs
kubectl get jobs -n kube-bench
kubectl get pod -n kube-bench
