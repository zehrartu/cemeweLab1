# 🧩 cemewe DevOps Course for beginners 🚀

## Terraform Lab 1 — Infrastructure as Code (IaC)

This lab demonstrates the use of **Terraform** to provision and manage infrastructure as code.  
It includes configuration files for defining variables, resources, and state management.

---

## 1. 🧰 Prerequisites

Before starting this lab, make sure you have the following tools installed and configured on your system:

### 🧱 Core Tools
- [**Terraform**](https://developer.hashicorp.com/terraform/downloads) — used for Infrastructure as Code (IaC)  
  ▶️ **Installation guide (YouTube):** [How to Install Terraform](https://www.youtube.com/watch?v=ntf5mvIvE2k)

- [**Git**](https://git-scm.com/downloads) — used for version control  
  ▶️ **Configuration guide (YouTube):** [Git Configuration Tutorial](https://www.youtube.com/watch?v=3Tsaxxv9sls)

- [**AWS CLI**](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) — used for managing AWS services via the command line  
  ▶️ **Installation guide (YouTube):** [AWS CLI Setup Tutorial](https://www.youtube.com/watch?v=u0JyzUGzvJA&t=296s)

---

### 🧩 Recommended VS Code Setup
Use **Visual Studio Code (VS Code)** as your IDE for this lab.  
It provides syntax highlighting, linting, and Terraform integration for a smoother workflow.

▶️ **Watch:** [Best VS Code Extensions for Terraform & DevOps](https://www.youtube.com/watch?v=ThlynejTCWE)

---

## 2. 🪞 Fork and Clone This Repository

Before starting the lab, each student should fork this repository into their own GitHub account and then clone it locally.

🧩 Steps to Fork the Repository

- Go to the main course repository on GitHub (provided by the instructor).

- Click the “Fork” button in the top-right corner to create a personal copy of the repository under your GitHub account.

- Once forked, open your forked repository and click “Code” → “Copy HTTPS URL”.

💻 Clone the Repository to Your Local Machine

Run the following commands in your terminal or VS Code:

Navigate to the directory where you want to store the project
```bash
cd ~/your-directory
```

Clone your forked repository (replace with your GitHub username)
```bash
git clone https://github.com/<your-github-username>/cemeweLab1.git
```

Move into the project directory
```bash
cd cemeweLab1
```

## 3. ⚙️ Configure Git (if not already configured)

If this is your first time using Git on your system, set your username and email:
```bash
git config --global user.name "Username"
git config --global user.email "email@example.com"
```
You can verify your configuration using:
```bash
git config --list
```

If you want to use different identities for specific projects (for example, one for personal projects and one for work), you can configure Git only for the current repository.

```bash
git config user.name "Username"
git config user.email "email@example.com"
```
## 4. 🧑‍💻 Update Your Student Name

Before running Terraform commands, open the `variables.tf` file and update the following variable:

```hcl
variable "student_name" {
  description = "Unique student identifier"
  type        = string
  default     = "test_student1"  # <-- Each student updates this value
}
```
## 5. 🪜 Step-by-Step Terraform Workflow

### 1. 🧰 Initialize Terraform

Run this command to download providers and initialize the working directory:
```bash
terraform init
```
### 2. 🧪 Validate Configuration

Check that your .tf files are syntactically and structurally correct.
```bash
terraform validate
```
### 3. 🧭 Create an Execution Plan

See what Terraform will do before actually applying any changes.
```bash
terraform plan
```
### 4. 🚧 Apply the Configuration

Provision your infrastructure as defined in the .tf files.
```bash
terraform apply
```
