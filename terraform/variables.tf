variable "project_id" {
  default = "ppetrov-internal-402521"
}

variable "region" {
  default = "us-east1"
}

variable "service_name" {
  default = "ex-zh-part1"
}

variable "app_version" {
  default = "1.0.10"
}

variable "app_container_port" {
  default = 80
}

variable "app_max_instances" {
  default = 2
}

variable "artifact_registry" {
  default = "us-east1-docker.pkg.dev"
}

variable "artifact_registry_format" {
  default = "DOCKER"
}

variable "artifact_registry_desc" {
  default = "ex-zh-part1 docker repository"
}

variable "gcs_cred_file" {
  default = "ppetrov-internal-402521-9e7e2e9cdcaf.json"
}

variable "gcs_prefix" {
  default = "cloud-run"
}