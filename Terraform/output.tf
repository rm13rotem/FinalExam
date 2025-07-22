output "public_ip" {
  value = aws_instance.builder.public_ip
    description = "EC2 public IP"
}

output "security_group_id" {
  value       = aws_security_group.builder_sg.id
  description = "Security group ID"
}

output "public_dns" {
  value = aws_instance.builder.public_dns  
  description = "EC2 public DNS name"
}


## Output the necessary details (required from mission definition)
output "ssh_private_key_path" {
  value       = local_file.private_key.filename
  description = "Path to the generated private SSH key"
  sensitive   = true
}

output "ssh_key_name" {
  value       = aws_key_pair.builder_key.key_name
  description = "Name of the AWS SSH key pair"
}
