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
