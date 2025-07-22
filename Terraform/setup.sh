#This is the fall back in case my terraform attempt burns to a crisp
# 1. SSH into your EC2 instance
ssh -i builder_key.pem ec2-user@13.222.28.69

# 2. Update the system
sudo yum update -y

# 3. Install Docker
sudo yum install -y docker

# 4. Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# 5. Add ec2-user to docker group (so you can run `docker` without `sudo`)
sudo usermod -aG docker ec2-user

# 6. Log out and back in so group changes take effect:
exit
# Then SSH back in again:
ssh -i builder_key.pem ec2-user@13.222.28.69

# 7. Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 8. Verify:
docker --version
docker-compose --version
