# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "my-pem" {
#   key_name = var.key_name
#   public_key = tls_private_key.MY-rsa-4096.public_key_openssh
# }

# resource "local_file" "my-local_file" {
#   content = tls_private_key.MY-rsa-4096.private_key_openssh
#   filename = var.pem_file_path
# }

# variable "key_name" {
#   type = string
#   description = "key name enter"
# }