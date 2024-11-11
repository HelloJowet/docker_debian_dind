FROM debian:bookworm

# Install necessary packages for setting up the Docker repository
RUN apt update && \
    apt install --no-install-recommends -y ca-certificates curl gnupg dpkg lsb-release

# Add Docker’s official GPG key
RUN install -m 0755 -d /etc/apt/keyrings 
RUN curl -sS https://download.docker.com/linux/debian/gpg | gpg --dearmor > /usr/share/keyrings/docker-ce.gpg
RUN chmod a+r /usr/share/keyrings/docker-ce.gpg

# Set up the Docker repository
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-ce.gpg] https://download.docker.com/linux/debian $(lsb_release -sc) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine, Docker CLI, and Docker Compose
RUN apt update && \
    apt install --no-install-recommends -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
