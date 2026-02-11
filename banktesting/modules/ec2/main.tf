resource "aws_instance" "IndServer" {
  ami = var.ami_id
  instance_type = var.inst_type
  key_name = var.key_id
  subnet_id = var.sub_id
  security_groups = var.firewall_id
  tags = {
    Name = var.Env
  }
}
