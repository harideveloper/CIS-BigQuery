## gcloud Commands

## GKE Cluster

gcloud beta container clusters create "cis" \
--project "your-project-name" \
--zone "<zone>" \
--machine-type "e2-medium" \
--image-type "COS_CONTAINERD" \
--disk-type "pd-balanced" \
--disk-size "50" \
--num-nodes "1" \
--network "projects/<your-project-name>/global/networks/default" \
--subnetwork "projects/<your-project-name>/regions/<region>/subnetworks/default" \
--node-locations "<zones>"


## BigQuery Dataset

bq --location=US mk -d \
    --default_table_expiration 3600 \
    --description "dataset to store cis benchmark results" \
    cis

## Log Sink Dataset

gcloud logging sinks create cis \
    bigquery.googleapis.com/projects/<your-project>/datasets/cis_benchmark_results \
    --log-filter='resource.type="k8s_container" AND
                   resource.labels.project_id="<your-project-id>" AND
                   resource.labels.location="<region>" AND
                   resource.labels.cluster_name="cis" AND
                   resource.labels.container_name="kube-bench" AND
                   (textPayload:"[INFO]" OR textPayload:"[WARN]" OR textPayload:"[PASS]" OR textPayload:"[FAIL]") AND
                   severity>=DEFAULT'



### Install kube-bench

## Connect to Cluster 
gcloud container clusters get-credentials cis \
--zone <zone> \
--project <your-project-name>

## Install Kube-bench
curl -o kube-bench.yaml https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job-gke.yaml

kubectl create ns kube-bench
kubectl apply -f kube-bench.yaml -n kube-bench

## Installation will spin up the following
  # 1. Kube-bench scheduler
  # 2. Kube-bench pods

## Verify the instllation by checks the pods/jobs
kubectl get jobs -n kube-bench
kubectl get pod -n kube-bench

# Verify the Pod logs
kubectl logs <pod-name> -n kube-bench
