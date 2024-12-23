SAFE_DIR="${HOME}"
SSH_SAFE_DIR="${SAFE_DIR}/.ssh"

cd cloud/digitalocean || exit

terraform init

terraform apply --auto-approve -var "do_token=${DO_API_TOKEN}" -var "pub_key=${SSH_SAFE_DIR}/id_rsa.pub" -var "pvt_key=${SSH_SAFE_DIR}/id_rsa" -var "ssh_fingerprint=$(ssh-keygen -lf "${SSH_SAFE_DIR}/id_rsa.pub" -E md5  | awk '{ print $2 }' | cut -c 5-)" -var "target_env=staging"

cd ../.. || exit

#ansible-galaxy install -r requirements.yml
#ansible-galaxy collection install community.general

#export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/connectivity.yml -e "target_env=staging"
#export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/essentials.yml -e "target_env=staging"

#sudo apt install python3-passlib
