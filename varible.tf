variable "ec2_ami" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-01a00762f46d584a1"
  type        = string
}

variable "ec2_type" {
  description = "The instance type for the EC2 instance"
  default     = "t3.micro"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  # default     = "dec-new"
  type = string
}

variable "pem_file_path" {
  description = "The file path to the PEM file for the key pair"
  # default     = "C:/Users/DELL/Downloads/dec-new.pem"
  type = string
}