# Provider setup

* Create an account at digital ocean
  * Visit [dogitalocean](https://www.digitalocean.com) and follow the onboarding steps
* Configure the root ssh key at digital ocean
  * Visit the [security](https://cloud.digitalocean.com/account/security) section and configure your ssh key
  * That key should ideally NOT be used for the classic execution, just for the root account. Your playbooks should ideally generate another ssh keypair