variable "region" {
  default = "us-west1"
}

variable "project" {
  default = "esparta86project"
}


variable "zones" {
  type        = list(string)
  description = "the zone to create the cluster"

  default = ["us-west1-a", "us-west1-b"]
}


variable "name_gke" {
  type        = string
  description = "gke cluster name"
  default     = "gke-tf"
}

variable "machine_type" {
  type        = string
  description = "type of node compute engine"
  default     = "n1-standard-2"
}

variable "min_count" {
  type        = number
  description = "minimun number of nodes in the nodepool"
  default     = 1
}

variable "max_count" {
  type    = number
  default = 3
}

variable "disk_size_gb" {
  type    = number
  default = 80
}

variable "initial_node_count" {
  type    = number
  default = 2
}


variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "image_type" {
  type    = string
  default = "ubuntu_containerd"
}

variable "service_account" {
  type = string
  default = "col886@esparta86project.iam.gserviceaccount.com"
}

variable "subnetwork" {
  type = string
  default = "custom-subnet"
  
}