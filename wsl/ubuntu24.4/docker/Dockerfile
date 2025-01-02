FROM ubuntu:24.04

# Install Ansible
RUN apt-get update && \
    apt-get install -y ansible python3 python3-pip && \
    apt-get clean

# Copy project files
WORKDIR /ansible
COPY ansible /ansible

# Set entrypoint for Ansible execution
ENTRYPOINT ["/ansible/entrypoint.sh"]