# Topic 01: End-to-End Azure Infrastructure Deployment

## 📌 Project Overview

In this project, I used Terraform to deploy a complete infrastructure flow on Azure. The goal was to understand how to create resources and upload data to a storage service using a hardcoded configuration.

## 🏗️ Resources Created
*   **Resource Group:** Created a logical container named `prod-rg`.
*   **Storage Account:** Deployed a Standard LRS storage account named `prdstr`.
*   **Storage Container:** Created a private container named `prodcntr` for data storage.
*   **Storage Blob:** Successfully uploaded a local file (`demo.txt`) to the Azure container as a blob.

## 🛠️ Terraform Commands Used
1.  `terraform init`: To initialize the directory and download the AzureRM provider.
2.  `terraform plan`: To review the resource execution plan.
3.  `terraform apply`: To deploy the infrastructure and upload the file to Azure.

## 💡 Key Learnings
*   Setting up the Azure Provider and authenticating with Terraform.
*   Managing resource dependencies (Resource Group -> Storage -> Container -> Blob).
*   Verifying data integrity by checking uploaded files in the Azure Portal.

---
