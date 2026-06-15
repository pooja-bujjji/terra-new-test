resource "aws_instance" "my_ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  tags = {
    Name = "My_terraform_ec2"
  }

}

resource "tls_private_key" "MY-rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = tls_private_key.MY-rsa-4096.public_key_openssh
}
resource "local_file" "private_key" {
  content  = tls_private_key.MY-rsa-4096.private_key_openssh
  filename = var.pem_file_path
}



resource "aws_s3_bucket" "myy_buc" {
  bucket = var.s3_bucket_name
}

# resource "aws_s3_bucket_acl" "my_acl" {
#   bucket = aws_s3_bucket.myy_buc.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_my-bucc" {
  bucket = aws_s3_bucket.myy_buc.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "MYY-BUC-SSE" {
  bucket = aws_s3_bucket.myy_buc.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_security_group" "my-sg" {
  name        = "my_security_group"
  description = "Security group for my EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# locals {
#   ec2_type = "t3.micro"
# }