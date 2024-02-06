terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.15.0"
    }
  }
}

provider "google" {
  project     = "crucial-raceway-413519"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "crucial-raceway-413519-terrabucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}