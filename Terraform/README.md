# Terraform files
Terraform files for infrastructure setup

# Assumptions:
Region: us-east-1
The given VPC (vpc-044604d0bfb707142) already contains public subnets
I am creating a key pair for SSH

# File Structure
terraform/
├── main.tf
├── variables.tf
├── outputs.tf

#According to instructions we need to run 
curl ifconfig.me
terraform apply -var="my_ip_cidr=##.##.##.##/32"

#Documentation of success
init - in init.txt
apply - in apply.txt



