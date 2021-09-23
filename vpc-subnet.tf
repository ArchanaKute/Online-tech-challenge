/**************************************************
Creating VPC Network and Subnets
**************************************************/
module "demo-vpc-subnet" {
  source       = "git::https://source.developers.google.com/p/demo-proj/r/demo-bucket//modules/network?ref=tags/v1.2.3"
  network_name = "demo-test-network"
  project_id   = "demo-vpc-proj"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "demo-subnet"
      subnet_ip             = "10.0.0.0/20"
      subnet_region         = "us-west1"
      subnet_flow_logs      = "true"
      subnet_private_access = "true"
      description           = "Subnet for test project"
      purpose               = null
      role                  = null
    },
    ]
}
  
/**************************************************
Creating Cloud Router for NAT
**************************************************/
module "test-nat-uswe1-01" {
  source       = "git::https://source.developers.google.com/p/demo-proj/r/demo-bucket//modules/network?ref=tags/v1.2.3"
  router_name  = "test-router-nat-uswe1-01"
  network_name = module.demo-test-network.id
  region_name  = "us-west1"
  project_id   = "demo-vpc-proj"
}

/**************************************************
Creating Cloud NAT
**************************************************/
module "test-uswe1-01" {
  source                              = "git::https://source.developers.google.com/p/demo-proj/r/demo-bucket//modules/network?ref=tags/v1.2.3"
  project_id                          = "demo-vpc-proj"
  region_name                         = "us-west1"
  nat_name                            = "test-nat-uswe1-01"
  router_name                         = "test-router-nat-uswe1-01"
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 300
  log_config_enable                   = true
  log_config_filter                   = "ALL"
}

  /**************************************************
  Creating GCE
***************************************************/

module "test-mod-vm" {

  source              = "git::https://source.developers.google.com/p/demo-proj/r/demo-bucket//modules/network?ref=tags/v1.2.3"
  project_id          = "demo-vm-proj"
  instance_name       = "demo-vm"
  machine_type        = "e2-standard-16"
  zone_name           = "us-east1-b"
  deletion_protection = true

  network_interface = [
    {
      network_name       = null
      external_ip_needed = false
      subnetwork_name    = "projects/demo-vpc-proj/regions/us-east1/subnetworks/demo-subnet"
      network_ip         = null
      access_config      = {}
      alias_ip_range     = []
  }]

  boot_disk = {
    image = "projects/demo-vm-proj/global/images/cvm-0006"
    size  = "50"
    type  = "pd-ssd"
  }
  labels = {
    "platform-name" = "test"
  }
  shielded_instance_config = {
    "enable_secure_boot" = "true"
  }
  service_account = {
    email  = "test-service-account@demo-vpc-proj.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
