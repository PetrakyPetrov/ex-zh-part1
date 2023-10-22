resource "google_cloud_run_v2_service" "default" {
    name     = var.service_name
    location = var.region

    template {
        scaling {
            max_instance_count = var.app_max_instances
        }
        containers {
            image = "${var.artifact_registry}/${var.project_id}/${var.service_name}/${var.app_version}"
            ports {
                container_port = var.app_container_port 
            }
            startup_probe {
                initial_delay_seconds = 0
                timeout_seconds = 1
                period_seconds = 3
                failure_threshold = 1
                tcp_socket {
                    port = var.app_container_port 
                }
            }
            liveness_probe {
                http_get {
                    path = "/"
                }
            }
        }
    }

    traffic {
        type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
        percent = 100
    }

    lifecycle {
        ignore_changes = [
            launch_stage,
        ]
    }
}

data "google_iam_policy" "noauth" {
    binding {
        role    = "roles/run.invoker"
        members = [
            "allUsers",
        ]
    }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
	location    = google_cloud_run_v2_service.default.location
	project     = google_cloud_run_v2_service.default.project
	service     = google_cloud_run_v2_service.default.name

	policy_data = data.google_iam_policy.noauth.policy_data
}
