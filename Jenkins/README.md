# CI/CD pipeline configuration

CI/CD pipeline configurations:
	Jenkinsfile
	YAML

# Section 5 Goals Recap:
Jenkinsfile must:

	Clone the Git repo.

	Build Docker image.

	In parallel:

		Run Linting (e.g., Flake8, ShellCheck, Hadolint).

		Run Security Scanning (e.g., Trivy, Bandit).

	Push Docker image to Docker Hub.

Jenkins pipeline must:

	Complete all stages without failure.

	Push the image to Docker Hub successfully.

# Required Setup on Jenkins EC2 (Builder Machine):
##Jenkins Docker Permissions:

Ensure Jenkins is in the docker group:

Ran the following : 
	sudo usermod -aG docker jenkins
	sudo systemctl restart jenkins

##Install Required Tools on the Agent EC2 (your Builder):

Ran the following
	sudo apt update
	sudo apt install -y flake8 bandit shellcheck docker.io curl

	# Install Hadolint
	wget -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64
	chmod +x /usr/local/bin/hadolint

	# Install Trivy
	curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin
	
## Jenkins UI → Manage Jenkins → Credentials.

	Add Jenkins Docker Hub Credentials:
	Add Username/Password credential with your Docker Hub credentials.

	Use ID dockerhub-creds (or change the name in the Jenkinsfile if needed).