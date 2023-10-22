resource "google_artifact_registry_repository" "ex-zh-part1" {
  location      = "${var.region}"
  repository_id = "${var.service_name}"
  description   = "${var.artifact_registry_desc}"
  format        = "${var.artifact_registry_format}"

  docker_config {
    immutable_tags = true
  }
}