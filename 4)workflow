Terraform is an Infrastructure as Code (IaC) tool by HashiCorp.
It lets you define your cloud resources (like EC2, VPC, S3, etc.) using code — and then create, update, or delete them automatically.

### terraform init — Initialize
Purpose: Initializes the Terraform working directory.

Downloads the provider plugins (e.g., AWS, Azure, GCP)
Prepares Terraform to run
Creates a hidden folder .terraform/ for internal files
✅ Run this first when you create a new Terraform project or change providers.


### terraform plan — Preview
Purpose: Shows you what Terraform will do before it actually changes anything.

Reads your .tf files and current cloud setup
Compares the desired state (in your code) with the actual state (in the cloud)
Prints a plan — showing which resources will be created, changed, or destroyed
✅ Run before apply to review changes safely.


### terraform apply — Build / Deploy
Purpose: Actually creates or updates the infrastructure in your cloud account.

Executes the plan
Calls your cloud provider’s API (like AWS EC2, S3, etc.)
Saves the state in a file called terraform.tfstate (this keeps track of what Terraform created)
✅ Use only after reviewing the plan.

You’ll be asked to confirm:
Do you want to perform these actions?
  Only 'yes' will be accepted to approve.


### terraform destroy — Tear Down
Purpose: Deletes all infrastructure Terraform created.

Reads the terraform.tfstate
Finds all resources created
Deletes them safely from your cloud account
✅ Useful for cleanup or testing.

=====================================================================================

Typical Terraform Flow:

Write .tf files
      ↓
terraform init
      ↓
terraform plan
      ↓
terraform apply
      ↓
(terraform destroy) — optional cleanup

