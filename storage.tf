resource "google_storage_bucket" "functions_bucket" {
  name          = "${var.project_name}-functions-bucket"
  project       = var.project_name
  location      = "ASIA-NORTHEAST1"
  force_destroy = true
}