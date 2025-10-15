# 🌦️ Weather Dashboard — Full DevOps Automation Project

This project turns a simple **React Weather App** into a **fully automated cloud-deployed system** using Docker, Terraform, and GitHub Actions — representing a real-world **CI/CD + IaC DevOps pipeline**.

It covers everything from **source code to live cloud deployment**, automatically provisioning infrastructure and running the containerized app on AWS.

---

## 🚀 Project Highlights

| Stage                          | Description                                           | Tools                 |
| ------------------------------ | ----------------------------------------------------- | --------------------- |
| 🐳 **Containerization**        | Dockerized the React Weather App for production       | Docker                |
| ⚙️ **Orchestration**           | Multi-container setup with reverse proxy              | Docker Compose, Nginx |
| 🔁 **CI/CD Pipeline**          | Automated build → test → deploy using GitHub Actions  | GitHub Actions        |
| ☁️ **Cloud Infrastructure**    | Automated AWS provisioning via Terraform              | Terraform, AWS        |
| 🏗️ **Infrastructure as Code** | VPC, Subnets, Route Tables, IGW, EC2, Security Groups | Terraform             |
| 🔒 **Secrets Management**      | Secured API keys & credentials using GitHub Secrets   | GitHub Secrets        |
| 📦 **Artifact Management**     | Built and pushed Docker images to Docker Hub          | Docker Hub            |

---

## 🧰 Tech Stack

* **Frontend:** React (Create React App)
* **Web Server:** Nginx
* **Containerization:** Docker
* **Orchestration:** Docker Compose
* **CI/CD:** GitHub Actions
* **IaC:** Terraform
* **Cloud Provider:** AWS (EC2, VPC, S3 backend)
* **State Management:** Terraform Remote State (S3)

---

## ⚙️ Complete Workflow Overview

### 🧩 CI Stage

1. Checkout code
2. Setup Node environment
3. Install dependencies
4. Lint + test code
5. Build production app
6. Setup Docker
7. Build + push image to Docker Hub

✅ **Trigger:** Push or PR to `main` branch

### ☁️ CD Stage

1. Triggered automatically after CI success
2. Configure AWS credentials (from secrets)
3. Initialize Terraform backend (S3)
4. Plan & Apply infrastructure

   * Creates **VPC**, **2 subnets (public/private)**, **IGW**, **Route Table**, and **Security Group**
   * Launches **EC2 instance** in the public subnet
5. Installs Docker on EC2
6. Pulls the latest image from **Docker Hub**
7. Runs the containerized weather app
8. Keeps instance live for ~2–3 minutes → then automatically destroyed (ephemeral infra)

---

## 🏗️ Folder Structure

```
weather-dashboard-devops/
│
├── .github/workflows/          # CI/CD pipelines
│   ├── cicd.yml
│
├── nginx/                      # Reverse proxy config
├── src/                        # React app source code
├── public/
├── terraform/                  # Terraform IaC configs
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── Dockerfile                  # Docker build instructions
├── docker-compose.yml          # Orchestration config
├── .dockerignore
├── package.json
├── README.md
└── yarn.lock
```

---

## 📸 Screenshots & Proof of Work

1️⃣ **Docker Hub:** Image successfully pushed to repository
<img width="1633" height="534" alt="Screenshot 2025-10-15 120438" src="https://github.com/user-attachments/assets/7d59776f-f7a3-4de1-bbdb-3f639c45a3a4" />

2️⃣ **AWS EC2:** Instance running and app container deployed
<img width="1609" height="341" alt="Screenshot 2025-10-15 122354" src="https://github.com/user-attachments/assets/88d7039d-5467-4979-98d0-65b4dc821025" />

3️⃣ **VPC Resource Map:** Visual of Terraform-created networking setup
<img width="1920" height="595" alt="Screenshot 2025-10-15 122452" src="https://github.com/user-attachments/assets/518c2880-a95f-4de8-b7e7-0fbb006c2c92" />

4️⃣ **Browser:** Weather App accessible on port 80
<img width="1919" height="1028" alt="Screenshot 2025-10-15 122557" src="https://github.com/user-attachments/assets/2c91b84e-827e-4313-a1a7-117d86cbca87" />

5️⃣ **Terraform State in S3:** Remote backend storage proof
<img width="1919" height="783" alt="Screenshot 2025-10-15 123316" src="https://github.com/user-attachments/assets/f03b4864-dac5-4744-bcc2-7f9b18bb7db3" />

6️⃣ **GitHub Actions:** Successful CI/CD workflow run
<img width="1916" height="728" alt="Screenshot 2025-10-15 123425" src="https://github.com/user-attachments/assets/c9967d50-a35d-4bae-bbdd-b29c8a97be03" />

7️⃣ **GitHub Secrets:** Environment variables setup 
<img width="1023" height="443" alt="image" src="https://github.com/user-attachments/assets/9b722aea-3058-4db3-b07a-10d9680bf407" />


---

## 🧠 Key Learnings

* Built a **complete DevOps pipeline** from scratch
* Automated cloud infra provisioning using **Terraform + AWS**
* Mastered **CI/CD with dependent jobs** (CD waits for CI)
* Integrated **Docker**, **AWS**, and **Terraform** seamlessly
* Understood **ephemeral infra** and **remote state management**

---

## 📜 License

MIT License © 2025 Abdul Raheem

