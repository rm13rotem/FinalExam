# CI/CD pipeline configuration

CI/CD pipeline configurations:
	Jenkinsfile
	YAML

I already have docker installed, so I am not going to clone 
with the powerpoint we did in class. Just going to "suck up"
a container and roll with it on the Jenkins file above
(quick and not so dirty)

docker --version
I got 
>>>>Docker version 27.5.1, build 27.5.1-0ubuntu3~24.04.2

great. Now load docker image of Jenkins: 
docker volume create jenkins_data
docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_data:/var/jenkins_home \
  jenkins/jenkins:lts


# Section 5 Goals Recap:
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