# output "ec2_publicip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.my_ec2.public_ip
# }
# output "ec2_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.my_ec2.id
# }
# output "ec2_arn" {
#   description = "ARN of the EC2 instance"
#   value       = aws_instance.my_ec2.arn
# }
# output "my_security_group_id" {
#   description = "ID of the security group associated with the EC2 instance"
#   value       = aws_instance.my_ec2.security_groups[0]
# }