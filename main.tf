resource "aws_instance" "workstation" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  user_data = file("k8.sh")

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  tags = {
    Name = "workstation"
    Project = "workstation-roboshop"

  }
}

