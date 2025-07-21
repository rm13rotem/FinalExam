
variable "my_ip_cidr" {
  description = "my public IP address in CIDR notation"
  type        = string
}

# I will figure this one out on my machine by running
# curl ifconfig.me

# and running ... terraform apply -var="my_ip_cidr=35.86.136.73/32"

