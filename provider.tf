provider "google" {
  credentials = file(var.credential)
  project     = var.project_name
  region      = "asia-northeast1"
}