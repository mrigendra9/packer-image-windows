This project builds a custom Linux (Ubuntu) Golden Image on Azure using HashiCorp Packer.
The image comes pre-configured with:

NGINX web server

Application code cloned from GitHub

Proper OS generalization using Azure Linux Agent (waagent)

Ready-to-use Managed Image for VM creation


# Project Structure

azure-unix-packer-custom-image/
│
├── main.pkr.hcl              # Packer entry file
├── linux.pkr.hcl             # Azure ARM source + build definition
├── variables.pkr.hcl         # Input variables (GitHub token etc.)
│
├── provisioners/
│   ├── nginx_app.sh          # Install nginx + deploy app
│   └── generalize.sh         # Azure VM generalization
│
└── README.md

# Architecture Flow 

Packer
  |
  |-- Azure ARM Builder
        |
        |-- Temporary Resource Group
              |
              |-- Temporary VM
                    |
                    |-- NGINX Install
                    |-- GitHub Repo Clone
                    |-- App Deployment (/var/www/html)
                    |-- waagent Deprovision
              |
        |-- Managed Image Creation
        |
  |-- Cleanup Temporary Resources


# Run the Command for execution 

packer init .
packer validate .
packer build .

