resource "google_artifact_registry_repository" "ex-zh-part1" {
  location      = "us-east1"
  repository_id = "ex-zh-part1"
  description   = "ex-zh-part1 docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}