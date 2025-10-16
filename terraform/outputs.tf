output "ec2_public_ip" {
  value = aws_instance.main.public_ip
  description = "this will output ec2 public ipv4 address"
}
