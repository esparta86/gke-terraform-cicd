# data "google_compute_zones" "available" {
#   filter {
#     name   = "zone-name"
#     values = ["us-west-1a", "us-west-1c"]
#   }
# }


resource "google_compute_network" "vpc_network_main" {
  project = var.project_id[terraform.workspace]
  name = "vpc-${terraform.workspace}"
  auto_create_subnetworks = false
  routing_mode = var.routing_mode_vpc

}


resource "google_compute_subnetwork" "subnet" {
  name = "subnet-${terraform.workspace}"
  ip_cidr_range = var.ip-ranges-env["subnet-${terraform.workspace}"]

  network = google_compute_network.vpc_network_main.id

  private_ip_google_access = true

  secondary_ip_range = [ {
    ip_cidr_range = var.ip-ranges-env["subnet-k8s-pods"]
    range_name = "secondary-ip-pods"
  },{
    ip_cidr_range = var.ip-ranges-env["subnet-k8s-services"]
    range_name = "secondary-ip-svcs"
  } ]

 depends_on = [
   google_compute_network.vpc_network_main
 ]

}


#### Router NAT

resource "google_compute_router" "router" {
  name = "router-${terraform.workspace}-${google_compute_network.vpc_network_main.name}"
  network = google_compute_network.vpc_network_main.id

  region = google_compute_subnetwork.subnet.region

  bgp {
    asn = var.config-routers["${terraform.workspace}-asn"]
  }

  depends_on = [
    google_compute_subnetwork.subnet
  ]
}

# resource "google_compute_address" "address_nat" {
#  count = 2
#  name = "ip-manual-address-${count.index}"
#  region = google_compute_router.router.region

#  address_type = "EXTERNAL"


# }


resource "google_compute_router_nat" "nat" {
  name = "router-nat-${terraform.workspace}"
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  # nat_ips = google_compute_address.address_nat.*.self_link

}
