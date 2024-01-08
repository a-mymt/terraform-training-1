resource "google_cloudfunctions2_function" "function" {
  name = "function-test-0"
  location = "asia-northeast1"
  description = "a new function"

  build_config {
    runtime = "go119"
    entry_point = "HelloHTTP"
    source {
      storage_source {
        bucket = "training-for-terraform-operator"
        object = "function-source.zip"
      }
    }
  }

  service_config {
    min_instance_count  = 0
    max_instance_count  = 1
    timeout_seconds     = 60
  }
}

resource "google_cloudfunctions2_function_iam_member" "invoker" {
  project        = google_cloudfunctions2_function.function.project
  location       = google_cloudfunctions2_function.function.location
  cloud_function = google_cloudfunctions2_function.function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}

resource "google_cloud_run_service_iam_member" "cloud_run_invoker" {
  project  = google_cloudfunctions2_function.function.project
  location = google_cloudfunctions2_function.function.location
  service  = google_cloudfunctions2_function.function.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
