# 🚀 Terraform State Lock Lab

## 📌 Overview
In this lab, we kept all Terraform code in a single `main.tf` file.  
We used hardcoded values to make it easy for beginners to understand.

---

## 🤔 What is State Lock?
State lock prevents multiple users from modifying the same Terraform state file at the same time.  
It avoids conflicts and keeps your infrastructure safe.

---

## 🏢 Real Company Scenario (Why It’s Important)

Imagine a production environment:

- 👨‍💻 **User A** runs `terraform apply`
- Something goes wrong, and deployment gets stuck (he cannot complete it)

Now:

- 👨‍💻 **User B** tries to run `terraform apply`
- ❌ Terraform throws an error because the state is locked

---

## 🔓 How to Fix (Breaking the Lock)

User B has 2 options:

### 1. Break lock from portal  
You can manually remove the lock from the backend storage (Azure portal).

### 2. Break lock using command

terraform force-unlock <LOCK_ID>

After unlocking:

✅ Deployment can continue normally


## 🏗️ What We Created in This Lab

We followed these steps:

- Created a Resource Group (RG)
- Created a Storage Account
- Created a Container
- Used backend block to store Terraform state in the storage account

## ✅ Key Takeaways

- State lock avoids conflicts in team environments
- Only one person can run terraform apply at a time
- Lock must be removed if deployment gets stuck
- Remote backend (Storage Account) is required for locking


## 💡 Simple Summary

👉 State lock = Safety lock for Terraform state file  
👉 Prevents multiple users from breaking infrastructure  

## 📸 I have also added snapshots in this project for better understanding.

**Terminal Error Output:**

![State Lock Error](./state%20lock%20error%20output.png)

---

**Unlock Evidence:**

![State Lock Portal](./state%20lock%20break%20output.png)

---