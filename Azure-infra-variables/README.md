Topic 02: Mastering Terraform Variables 🚀

This repository documents my journey of moving from Hardcoded values to a Dynamic and scalable infrastructure using Terraform variables. I have covered 4 different scenarios to master the logic.

📖 Key Concepts
Variables: These are placeholders used to define values once and reuse them throughout the code. They make the configuration reusable and easy to manage.

Count Argument: This is used to create multiple resources of the same type (like multiple Resource Groups) without repeating the code. It helps in avoiding code duplication.

Terraform.tfvars File: This file is used to assign actual values to the variables. It keeps our infrastructure logic separate from the actual data/values.


📂 Project Scenarios
Scenario-01-Basic: Introduction to defining and using basic string variables.

Scenario-02-Count & Lists: Using count and list(string) to deploy 5 different Department Resource Groups in one go.

Scenario-03-The .tfvars Way: Professional approach to separating infrastructure logic from user data.

Scenario-04-Multi-Location: Advanced mapping where each Resource Group is deployed to a different Azure Region (East US, Central India, etc.) using custom variable files.


📸 Proof of Work
I have included Snapshots in each folder showing:

Terraform Plan: The execution plan before deployment.

Azure Portal: Confirmation that the resources were successfully created.