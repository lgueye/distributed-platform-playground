export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/discovery_servers.yml -e "target_env=staging"
