# **Topic 02: Terraform Variables Mastery** 🚀

![Terraform](https://img.shields.io/badge/Terraform-v1.x-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure)
![Infrastructure as Code](https://img.shields.io/badge/Infrastructure_as_Code-IaC-orange?style=for-the-badge)
![Variables](https://img.shields.io/badge/Terraform-Variables-success?style=for-the-badge)
![Dynamic Configuration](https://img.shields.io/badge/Configuration-Dynamic-blue?style=for-the-badge)
![Scalability](https://img.shields.io/badge/Architecture-Scalable-brightgreen?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Production_Ready-success?style=for-the-badge)
![Learning Path](https://img.shields.io/badge/DevOps-Learning_Path-red?style=for-the-badge)

---

This repository documents my journey of moving from **Hardcoded** values to a **Dynamic** and scalable infrastructure using Terraform variables. I have covered 4 different scenarios to master the logic.

---

## **1. Key Concepts** 📖

*   **Variables:** These are placeholders used to define values once and reuse them throughout the code. They make the configuration reusable and easy to manage.
*   **Count Argument:** This is used to create multiple resources of the same type (like multiple Resource Groups) without repeating the code. It helps in avoiding code duplication.
*   **Terraform.tfvars File:** This file is used to assign actual values to the variables. It keeps our infrastructure logic separate from the actual data/values.

---

## **2. Project Scenarios** 📂

### **Scenario-01: Basic**
*   Introduced `variables.tf` to remove hardcoded strings.
*   Learned how to call variables in `main.tf`.

**Deployment Result:**

![Scenario 1 Result](./Scenario-01-Basic/S%201%20result.png)

---


### **Scenario-02: Count & Lists**
*   Used `count` along with `list(string)` to deploy 5 different Department Resource Groups (Marketing, Sales, IT, etc.) in a single execution.
*   Learned how `count.index` helps in picking different names from a list.

**Deployment Result:**
![Scenario 2 Result](./Scenario-02-Count-multi-rgs/s%202%20result.png)

---

### **Scenario-03: The .tfvars Way**
*   Implemented the professional industry standard.
*   Stored all values in `terraform.tfvars`, allowing Terraform to automatically pick them up.

**Deployment Result:**
![Scenario 3 Result](./Scenario-03-tfvars-multi-rgs/s%203%20tfvars%20result.png)

---

### **Scenario-04: Multi-Location Mapping**
*   Deployed multiple Resource Groups, each in a **different Azure Region** (e.g., Central India, East US, UK South).
*   Practiced using custom variable files with the `-var-file` flag.

**Deployment Result:**
![Scenario 4 Result](./Scenario-04-Multi-Loc/s%204%20multi_locations.png)

---
## **3. Summary** ✅
All scenarios were successfully validated. The use of variables and meta-arguments like `count` has significantly reduced code redundancy and improved maintainability.
