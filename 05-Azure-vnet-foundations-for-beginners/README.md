# 🚀 Azure Virtual Network (VNet) - Beginner Foundation

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

🎯 Goal of This Project

Understand Azure networking basics
Learn how to create VNet and Subnets using Terraform
Practice Infrastructure as Code (IaC)


📌 Notes

Ensure Azure CLI is logged in before running Terraform
Modify variables as per your requirement
Keep your state file safe (use remote backend in real projects)


🙌 Conclusion

This project helps beginners build a strong foundation in Azure Networking + Terraform by implementing real-world concepts in a simple way.
