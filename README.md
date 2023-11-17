# Deploy Windows Server 2022 on Linode

Deploy Windows Server 2022 on Linode VM using `terraform` and `StackScript`


## Workflow

### 1. Install `terraform`

documentation: [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### 2. Pre-install Steps

#### 2.1 Create Linode API Key
documentation: [Manage Personal Access Tokens](https://www.linode.com/docs/products/tools/api/guides/manage-api-tokens/)

#### 2.2 Create SSH Keypair

Used for SSH-ing into Linode instance

```bash
ssh-keygen -f ~/linode.id_rsa
```

### 3. Set terraform variables

Fill out the `terraform.tfvars` file

- `token`: your Linode API key created in [Step 2.1](#21-create-linode-api-key)
- `ssh_key`: SSH public key created in [Step 2.2](#22-create-ssh-keypair)
- `vm_password`: Password used for login when Linode instance is provisioned

example:

```bash
cat << EOF > terraform.tfvars
token="< Input your actual token here >"
ssh_key="$(cat ~/linode.id_rsa.pub)"
vm_password="$(echo "123456a@" |base64)"
EOF
```

### 4. Initialize `terraform stack`
```bash
terraform init
```

### 5. Provision resources
```bash
terraform apply -auto-approve
```

### 6. Monitor provisioning and Windows Server installation progress

Monitor installation using [Linode Web Console](https://cloud.linode.com/linodes) and [Glish](https://www.linode.com/docs/products/compute/compute-instances/guides/glish/)

### 7. Teardown provisioned resources
```bash 
terraform destroy
```