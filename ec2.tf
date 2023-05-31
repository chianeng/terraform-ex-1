data "template_file" "web_frontend" {
  template = "${file("tomcat.sh")}"  
}




resource "aws_instance" "backend" {
  ami           = var.backend_ami
  instance_type = var.backend_instance_type
  associate_public_ip_address = true
  availability_zone = var.azs[0]
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.webapp_sg.id]
  user_data = data.template_file.web_frontend.rendered
  key_name = aws_key_pair.deployer.key_name 
  tags = {
    Name = "${var.vpc_name}-${var.backend_instance_name}"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "backend-key"
  public_key = tls_private_key.private_key.public_key_openssh
}
