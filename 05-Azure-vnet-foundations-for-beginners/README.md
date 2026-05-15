# Azure Virtual Network with Terraform: Networking Foundation Lab 🚀

![Terraform](https://img.shields.io/badge/Terraform-v1.x-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure)
![Azure Networking](https://img.shields.io/badge/Azure-Networking-blue?style=for-the-badge)
![Virtual Network](https://img.shields.io/badge/Virtual-Network-success?style=for-the-badge)
![Subnetting](https://img.shields.io/badge/Network-Subnetting-orange?style=for-the-badge)
![Infrastructure as Code](https://img.shields.io/badge/Infrastructure_as_Code-IaC-purple?style=for-the-badge)
![Cloud Architecture](https://img.shields.io/badge/Cloud-Architecture-brightgreen?style=for-the-badge)
![Foundation Lab](https://img.shields.io/badge/Azure-Network_Foundation-important?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Validated-success?style=for-the-badge)

---

This is a simple, beginner-friendly project to understand the basics of Azure Networking using Terraform.

---

## 📚 Key Terms 

### 1. Virtual Network (VNet)
A VNet is like your own private network in Azure cloud.  
Think of it as a **big boundary or a society** where your resources (VMs, Databases, etc.) can communicate securely.

---

### 2. Address Space
Address Space is the total range of IP addresses assigned to your VNet.  
It represents the **total number of plots available in your society**.

**Example:**
10.0.0.0/16


---

### 3. Subnet
A Subnet is a smaller division of a VNet.  
It helps in organizing resources into different sections like **Web, App, Database layers**.

---

### 4. Address Prefix
Address Prefix is the specific IP range assigned to a subnet.  
It must always be a subset of the VNet Address Space.

**Example:**
10.0.1.0/24



---

## 🛠️ Project Workflow (Step-by-Step)

In this project, we performed the following steps using `main.tf`:

1. **Create Resource Group (RG)**  
   - Acts like a folder to organize all resources.

2. **Create Virtual Network (VNet)**  
   - Defined the main network boundary with an address space.

3. **Create Subnet-1 (Web)**  
   - Dedicated subnet for web servers.

4. **Create Subnet-2 (DB)**  
   - Dedicated subnet for database servers.

---

## 💻 How to Run

Follow these commands to deploy the infrastructure:

### 1. Initialize Terraform

terraform init

### 2. Check Execution Plan

terraform plan

### 3. Deploy Resources

terraform apply

---

**Infrastructure Verification:**
![VNet with Subnets Result](./vnet%20with%20subnets%20result.png)

---

### 🎯 Goal of This Project

Understand Azure networking basics
Learn how to create VNet and Subnets using Terraform
Practice Infrastructure as Code (IaC)


### 📌 Notes

Ensure Azure CLI is logged in before running Terraform
Modify variables as per your requirement
Keep your state file safe (use remote backend in real projects)


### 🙌 Conclusion

This project helps beginners build a strong foundation in Azure Networking + Terraform by implementing real-world concepts in a simple way.
