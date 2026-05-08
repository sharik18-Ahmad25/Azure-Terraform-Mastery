# 🚀 Terraform for_each Mastery Lab

This project demonstrates how to use the `for_each` meta-argument in Terraform to create and manage multiple Azure Resource Groups (RGs) efficiently.

---

## 🔁 What is `for_each`?

`for_each` is used to create multiple resources from a collection (like list, set, or map), where each item creates one resource.

---

## 🧠 What You Will Learn

### 🔹 1. `toset()` (One-Dimensional)

Use `toset()` when all resources have the same configuration.

- Converts a list into a set (removes duplicates)  
- All resources share the same values (like location)

✅ **Use Case:**  
When you want multiple Resource Groups in the same region

💡 **Example:**
- `prod-rg01` → East US  
- `test-rg02` → East US  

---

### 🔹 2. `map()` (Two-Dimensional)

Use `map()` when each resource needs different values.

- Uses `each.key` → resource name  
- Uses `each.value` → resource-specific data (like location)

✅ **Use Case:**  
When deploying resources in multiple regions

💡 **Example:**
- `dev-rg` → East US  
- `prod-rg` → West US  

---

## 📂 Project Scenarios

### 🟢 Scenario 01: Using `toset()`
- Creates multiple Resource Groups  
- All share the same location  

✔ Simple and useful for identical setups  

**Execution Result:**
![Scenario 01](./scenario-01-toset/s%201%20toset%20result.png)

---

### 🟢 Scenario 02: Using `map()` (in variables file)
- Each Resource Group has a different location  
- Values are defined inside `variables.tf`  

✔ Better control for customization  

**Execution Result:**
![Scenario 02](./scenario-02-map/s%202%20map%20.png)

---



### 🟢 Scenario 03: Using `terraform.tfvars`
- Data is passed externally using `terraform.tfvars`  
- Makes code more flexible and production-ready  

✔ Best practice for real-world projects  

**Execution Result:**
![Scenario 03](./scenario-03-map-with-tfvars/s%203%20map%20tfvars.png)

---

## ⚡ Key Takeaway

- Use `toset()` → when all resources are the same  
- Use `map()` → when each resource is different  

---

## 💡 Final Thought

This lab helps you understand how to write clean, scalable, and reusable Terraform code using `for_each`.