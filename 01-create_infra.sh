ROOT_SSH_KEY_DIR="${HOME}/.ssh"

cd cloud/digitalocean || exit

terraform init

terraform apply --auto-approve -var "do_token=${DO_API_TOKEN}" -var "ssh_fingerprint=$(ssh-keygen -lf "${ROOT_SSH_KEY_DIR}/id_rsa.pub" -E md5  | awk '{ print $2 }' | cut -c 5-)" -var "target_env=staging"

cd ../.. || exit

ansible-galaxy install -r requirements.yml
ansible-galaxy collection install community.general

export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/connectivity.yml -e "target_env=staging"
export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/essentials.yml -e "target_env=staging"

#sudo apt install python3-passlib
