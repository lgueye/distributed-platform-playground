# This is the local safe for the distributed-platform-playground
# All locally created secrets should be created here
# SSH secrets should be located under ssh directory
# Consul secrets should be located under consul directory
# Etc.


SAFE_DIR="${HOME}/.distributed-platform-playground/safe"
SAFE_SSH_DIR="${SAFE_DIR}/ssh"

mkdir -p "${SAFE_SSH_DIR}"

cd "${SAFE_SSH_DIR}" || exit

# Create the ssh key pair for the automation user for later reuse.
ssh-keygen -q -t rsa -N '' -f "${SAFE_SSH_DIR}/id_rsa" <<<y >/dev/null 2>&1
chmod 600 "${SAFE_SSH_DIR}/id_rsa"
