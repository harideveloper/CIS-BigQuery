##### GKE
variable "project_id" {
  type    = string
  default = "GCP Project ID"
}

variable "application" {
  type    = string
  default = "cis"
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "subnet_name" {
  type    = string
  default = "subnet-01"
}

variable "subnet_ip" {
  type    = string
  default = "10.0.0.0/20"
}

variable "pod_cidr" {
  type    = string
  default = "10.10.0.0/20"
}

variable "svc1_cidr" {
  type    = string
  default = "10.100.0.0/24"
}

variable "svc2_cidr" {
  type    = string
  default = "10.100.1.0/24"
}

## GKE Cluster Module 

variable "gke_zone" {
  type    = string
  default = "europe-west2-b"
}

variable "gke_channel" {
  type    = string
  default = "REGULAR"
}

variable "gke_enabled" {
  type    = bool
  default = true
}

variable "namespace" {
  type    = string
  default = "kube-bench"
}

variable "kbench_path" {
  type    = string
  default = "k8/"
}









