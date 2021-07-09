# These commands need to be run prior to running the pulp installer ansible playbook. 

sudo systemctl enable --now

sudo dnf -y update && \
  dnf -y install \
  nano \
  net-tools \

