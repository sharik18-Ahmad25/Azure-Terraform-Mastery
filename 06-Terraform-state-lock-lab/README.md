# Terraform State Lock Lab: Secure Concurrent Infrastructure Management 🚀

![Terraform](https://img.shields.io/badge/Terraform-v1.x-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure)
![State Locking](https://img.shields.io/badge/Terraform-State_Locking-6A0DAD?style=for-the-badge)
![Concurrency Control](https://img.shields.io/badge/Concurrency-Control-orange?style=for-the-badge)
![Remote Backend](https://img.shields.io/badge/Remote-Backend-success?style=for-the-badge)
![Infrastructure Safety](https://img.shields.io/badge/Infrastructure-Safety-critical?style=for-the-badge)
![Team Collaboration](https://img.shields.io/badge/Team-Collaboration-blue?style=for-the-badge)
![Conflict Resolution](https://img.shields.io/badge/Deployment-Conflict_Resolution-brightgreen?style=for-the-badge)
![Production Workflow](https://img.shields.io/badge/DevOps-Production_Workflow-red?style=for-the-badge)

---

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