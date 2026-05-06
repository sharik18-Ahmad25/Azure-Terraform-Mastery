# ☁️ Azure Terraform Remote Backend Project

The main goal of this project is to set up a **Remote Backend on Azure**.  
This ensures that our infrastructure's "record book" (state file) is stored safely in the cloud instead of just on a local laptop.

---

## 📘 Key Concepts

### 1. What is a State File? (`terraform.tfstate`)
When Terraform creates resources, it keeps a detailed record in a JSON file called a **State File**.  
Think of it as Terraform’s "Memory" or "Brain"—it knows exactly what has been built and what needs to be changed.

---

### 2. What is a Backend Block?
By default, Terraform saves the state file on your own computer (locally).  
A **Backend Block** is a piece of code that tells Terraform:

> "Don't save the file here; instead, upload it to a cloud storage like Azure Blob Storage."

---

### 3. Why do we upload it to a Storage Account?

- 👥 **Teamwork (Collaboration):** If many people are working on the same project, everyone can access the same central file from the cloud.  
- 🔒 **Safety:** If your laptop crashes, your data is still safe in the cloud.  
- 🚫 **Locking:** It prevents two people from making changes at the exact same time, avoiding conflicts.

---

## 🔄 State File Workflow

- **Plan/Apply:** Terraform checks the cloud state file.  
- **Locking:** It "locks" the file so no one else can modify it during execution.  
- **Deployment:** It creates or updates infrastructure.  
- **Update:** It saves the new changes back to the cloud and unlocks the file.

---

## 🛠 Implementation Steps

### Step 1: Resource Group Deployment (Using `for_each`)
- Created Resource Groups using `for_each` for scalability.  
- Names and values were stored in `terraform.tfvars` to keep the code clean.

---

### Step 2: Storage Account (Using Variables)
- Created a Storage Account to store the state file.  
- Used variables for flexibility.  
- Linked it with the Resource Group created in Step 1.

---

### Step 3: Storage Container
- Created a **private container** inside the Storage Account.  
- This is where the `terraform.tfstate` file is stored.  
- Container name is managed using `terraform.tfvars`.

---

### Step 4: Backend Block & Initialization

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "remote-rg"
    storage_account_name = "statestrlab18"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


🚀 Final Result

After configuring the backend:

Run:

terraform init

Terraform asks:

"Do you want to move your local state to the cloud?"  type - Yes

We confirm it, and the state file is successfully migrated to Azure Storage Account 🎉