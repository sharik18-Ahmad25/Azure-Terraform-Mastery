# 🌍 Azure Global VNet Peering (Terraform Project)

<p align="center">

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Cloud-Microsoft%20Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![VNet Peering](https://img.shields.io/badge/Networking-VNet%20Peering-blue?style=for-the-badge&logo=azuredevops&logoColor=white)
![Global Peering](https://img.shields.io/badge/Scope-Global%20Peering-purple?style=for-the-badge)

<br>

![Build](https://img.shields.io/badge/Build-Passing-brightgreen?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-NSG%20Enabled-success?style=for-the-badge)
![Connectivity](https://img.shields.io/badge/Connectivity-Private%20Only-informational?style=for-the-badge)

<br>

![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)
![Maintained](https://img.shields.io/badge/Maintained-Yes-green?style=for-the-badge)
![Made With Love](https://img.shields.io/badge/Made%20With-❤-red?style=for-the-badge)

</p>

---

# 📌 What is Global VNet Peering?

Global VNet Peering allows two Virtual Networks in different regions to communicate with each other using private IP addresses.
It uses Azure’s backbone network, making the connection secure, fast, and reliable.

---

## 🏗️ Infrastructure Setup

**We deployed infrastructure in two different regions:**

- East US
- West Europe

**Each region includes:**

- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- Network Interface (NIC)
- Virtual Machine (VM)

![vm](./output-images/vms.png)

---


### 🔗 Global VNet Peering Configuration

- Established peering between both VNets
- Configured bi-directional connection
- Verified that peering status is Connected

![vnet peering](./output-images/vnet-peering.png)

---

## 🧪 Connectivity Testing

**🔹 Step 1: Connect to East US VM**

- Use SSH to connect from your local machine:

    ssh azureuser@<YOUR_PUBLIC_IP>

**🔹 Step 2: Ping West Europe VM (from East US)**

- Run the following command using private IP:

- ping <WEST_EUROPE_PRIVATE_IP>

![east to west](./output-images/east%20vm%20to%20west%20vm.png)

---

### 🔹 Step 3: Reverse Testing (West Europe → East US)

- Login into West Europe VM
- Connect to East US VM using private IP:

- ssh azureuser@<EAST_US_PRIVATE_IP>

**Then run ping**:

- ping <EAST_US_PRIVATE_IP>

![west to east](./output-images/west%20vm%20to%20east%20vm.png)

---

## ✅ Conclusion

- Global VNet Peering successfully connects VNets across regions
- Communication happens over private IPs only
- Low latency and secure connection using Azure backbone

---


**🚀 Future Enhancements**

- Add Azure Bastion for secure access
- Implement stricter NSG rules
- Integrate CI/CD using
- GitHub Actions
- Azure DevOps
- Add monitoring (Azure Monitor)

---