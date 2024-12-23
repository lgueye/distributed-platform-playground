export ANSIBLE_TF_DIR=cloud/digitalocean && ansible-playbook -i /etc/ansible/terraform.py provisioning/destroy_web_servers.yml -e "target_env=staging"

cd cloud/digitalocean || exit
terraform destroy --auto-approve -var "do_token=${DO_API_TOKEN}" -var "pub_key=${HOME}/.ssh/id_rsa.pub" -var "pvt_key=${HOME}/.ssh/id_rsa" -var "ssh_fingerprint=$(ssh-keygen -lf ~/.ssh/id_rsa.pub -E md5  | awk '{ print $2 }' | cut -c 5-)" -var "target_env=staging"
