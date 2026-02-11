output "Vpc_Id" {
  value = module.vpc_testing.vpc_id
}
output "Subnet_Id" {
  value = module.vpc_testing.subnet_id
}

output "Sg_Id" {
  value = module.sg_testing.security_group_id
}
output "inst_id" {
  value = module.ec2_instance.instance_id
}
output "instance_IP" {
  value = module.ec2_instance.instance_public_ip
}