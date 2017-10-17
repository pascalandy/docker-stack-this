docker swarm init --advertise-addr $(hostname -i); docker node ls;
# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates;
# Clone repo
cd /root;
git clone https://github.com/pascalandy/docker-stack-this.git;
cd docker-stack-this;
# Choose branch
git checkout 1.24;
# Go to the actual project
cd traefik_stack1; echo; pwd; echo; ls -AlhF;
# Make scripts executable
chmod +x runup; chmod +x rundown; chmod +x runctop;
# Run the stack
./runup;