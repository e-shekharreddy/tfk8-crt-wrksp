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

resource "aws_iam_role" "configure" {
  name = "admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"   # or lambda.amazonaws.com, etc.
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "aws-configure" {
  role       = aws_iam_role.configure.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
