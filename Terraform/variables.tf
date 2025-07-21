
variable "my_ip_cidr" {
  description = "my public IP address in CIDR notation"
  type        = string
}

# I will figure this one out on my machine by running
# curl ifconfig.me

# and running ... terraform apply -var="my_ip_cidr=35.86.136.73/32"

#had some serious trouble with part 2 so I reset the SSH keys

variable "ssh_key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file (used for SSH provisioner)"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your current IP address in CIDR format"
  type        = string
}

