
resource "aws_security_group" "kpsecuritygroup" {
   name = var.sg_name
   description = "Allow ssh http connection"
    vpc_id = var.Vpc_Id
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =var.ssh_ip
  }

  ingress {
    description = "http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks =var.http_ip
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =var.outbound_ip

  }

  tags = {
    Name = var.sg_name
  }
}