<h1 align="center">🚀 AWS Infrastructure Automation using Terraform</h1>

<p align="center">
  EC2 + VPC + S3 Deployment | Mumbai Region (ap-south-1)
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform&logoColor=white" />
  <img src="https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white" />
  <img src="https://img.shields.io/badge/EC2-Instance-FF9900?logo=amazonaws&logoColor=white" />
  <img src="https://img.shields.io/badge/S3-Storage-569A31?logo=amazon-s3&logoColor=white" />
  <img src="https://img.shields.io/badge/Region-ap--south--1-blue" />
</p>

📌 Project Overview

This project demonstrates how to provision an **Amazon EC2 instance** on AWS using **Terraform**, along with a complete networking setup and S3 configuration.

It follows **Infrastructure as Code (IaC)** principles to automate resource creation in a structured and reusable way.

✅ Features

- Infrastructure as Code (IaC) using Terraform  
- Automated AWS resource provisioning  
- Modular and clean file structure  
- Beginner-friendly implementation  
- Real-world AWS setup  

🏗️ Resources Created

🌐 Networking Layer
- VPC (Virtual Private Cloud)  
- Subnet  
- Internet Gateway (IGW)  
- Route Table  
- Route Table Association  

🖥️ Compute
- EC2 Instance (Ubuntu-based)

📦 Storage (S3)
- Created an S3 bucket  
- Uploaded `index.html` from local system  
- Configured public access (for demo purposes)  

---

📍 AWS Region

**ap-south-1 (Mumbai)**


⚙️ How to Use
1️⃣ Initialize Terraform
terraform init
2️⃣ Preview Changes
terraform plan
3️⃣ Apply Configuration
terraform apply

📂 Project Structure

├── provider.tf
├── vpc.tf
├── terraform.tf
├── .gitignore
└── README.md

💡 Key Highlights

- ✨ Beginner-friendly Terraform setup  
- ✨ Real-world AWS infrastructure  
- ✨ Clean and production-style structure  

---

⚠️ Notes

- Public S3 access is enabled only for demo  
- Avoid using public buckets in production  
- Ensure AWS credentials are configured  

---

🙌 Author

**Prajakta Zaware**
