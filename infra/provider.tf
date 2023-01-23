terraform {
  required_providers {
    google = {
      source  = "registry.terraform.io/hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.3.1"

  backend "gcs" {
    credentials = "esparta86project-col886.json"
    bucket      = "tf-states-cicd"
    prefix      = "terraform/state"
  }
}

provider "google" {

  credentials = file("esparta86project-col886.json")
  region      = var.region
  project     = var.project_id[terraform.workspace]
}


