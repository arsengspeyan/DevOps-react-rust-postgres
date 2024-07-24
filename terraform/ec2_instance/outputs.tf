output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.postgresql.id
}

output "private_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.postgresql.private_ip
}
