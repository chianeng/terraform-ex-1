resource "aws_instance" "backend" {
  ami           = var.backend_ami
  instance_type = var.backend_instance_type
  associate_public_ip_address = true
  availability_zone = var.azs[0]
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "${var.vpc_name}-${var.backend_instance_name}"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}