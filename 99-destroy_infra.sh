ROOT_SSH_KEY_DIR="${HOME}/.ssh"

cd cloud/digitalocean || exit
terraform destroy --auto-approve -var "do_token=${DO_API_TOKEN}" -var "ssh_fingerprint=$(ssh-keygen -lf "${ROOT_SSH_KEY_DIR}/id_rsa.pub" -E md5  | awk '{ print $2 }' | cut -c 5-)" -var "target_env=staging"
