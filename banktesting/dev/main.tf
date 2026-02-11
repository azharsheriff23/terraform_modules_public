

module "vpc_testing" {
  source = "../modules/vpc"
  vpc_block = "10.0.0.0/16"
  vpc_name = "KP_DEV_TESTING"
  sub_block1 = "10.0.1.0/24"
  sublocation1 = "us-west-2a"
  sub1_name = "Kp_Pub_SUB1"
  iplaunch = true
  ig_name = "Kp_IGW"
  everyip = "0.0.0.0/0"
  route_name = "Kp_default_route"
}

module "sg_testing" {
  source = "../modules/securitygroups"
  sg_name = "kp_sg"
  ssh_ip = ["0.0.0.0/0"]
  http_ip = ["0.0.0.0/0"]
  outbound_ip = ["0.0.0.0/0"]
  Vpc_Id =module.vpc_testing.vpc_id
}

module "ec2_instance" {
  source = "../modules/ec2"
  ami_id= "ami-055a9df0c8c9f681c"
  inst_type = "t3.micro"
  key_id = "hosting-key"
  sub_id = module.vpc_testing.subnet_id
  firewall_id = [module.sg_testing.security_group_id]
  Env = "KP_testing_DEV"
}