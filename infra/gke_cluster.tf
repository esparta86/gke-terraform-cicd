data "google_client_config" "default" {}

# provider "kubernetes" {
#   host                   = "https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }

data "google_compute_subnetwork" "subnetwork" {
  name = var.subnetwork
  project = var.project
  region = var.region
}

# module "gke" {
#   source                     = "terraform-google-modules/kubernetes-engine/google"
#   version                    = "24.0.0"
#   project_id                 = var.project
#   region                     = var.region
#   zones                      = var.zones
#   name                       = var.name_gke
#   network                    = "default"
#   subnetwork                 = "custom-subnet"
#   ip_range_pods              = "custom-pod-range"
#   ip_range_services          = "custom-services-range"
#   http_load_balancing        = false
#   horizontal_pod_autoscaling = true
#   network_policy             = true
#   kubernetes_version         = "1.20.15-gke.300"
#   create_service_account     = false
#   service_account            = var.service_account
#   regional                   = true

#   node_pools = [
#     {
#       name               = "default-node-pool"
#       machine_type       = var.machine_type
#       min_count          = var.min_count
#       max_count          = var.max_count
#       disk_size_gb       = var.disk_size_gb
#       disk_type          = var.disk_type
#       image_type         = var.image_type
#       auto_repair        = true
#       auto_upgrade       = true
#       service_account    = var.service_account
#       preemptible        = false
#       initial_node_count = var.initial_node_count

#     },
#   ]

#   node_pools_oauth_scopes = {
#     all = []

#     default-node-pool = [
#       "https://www.googleapis.com/auth/cloud-platform",
#     ]
#   }

#   node_pools_labels = {
#     all = {}

#     default-node-pool = {
#       default-node-pool = true
#     }
#   }

#   node_pools_metadata = {
#     all = {}

#     default-node-pool = {
#       node-pool-metadata-custom-value = "my-node-pool"
#     }
#   }

#   node_pools_taints = {
#     all = []

#     default-node-pool = [
#       {
#         key    = "default-node-pool"
#         value  = true
#         effect = "PREFER_NO_SCHEDULE"
#       },
#     ]
#   }

#   node_pools_tags = {
#     all = []

#     default-node-pool = [
#       "default-node-pool",
#     ]
#   }


#   master_authorized_networks = [
#       {
#           cidr_block = data.google_compute_subnetwork.subnetwork.ip_cidr_range
#           display_name = "VPC"
#       }
#   ]
# }