# 🌦️ Weather Dashboard — Full DevOps Pipeline Project

This project takes a simple **React Weather Dashboard** and transforms it into a **production-ready, cloud-deployed application** through a full DevOps pipeline.

It demonstrates my end-to-end understanding of:
- **Containerization (Docker)**
- **Orchestration (Docker Compose)**
- **Continuous Integration & Deployment (GitHub Actions)**
- **Cloud Deployment (AWS)**
- **Monitoring & Scalability**

---

## 🧭 Project Overview

| Stage | Description | Tools |
|--------|--------------|-------|
| 🐳 **1. Dockerization** | Containerized the React app with Nginx for production | Docker, Nginx |
| ⚙️ **2. Orchestration** | Used Docker Compose for managing multiple containers | Docker Compose, YAML |
| 🚀 **3. CI/CD Pipeline** | Automated build, test, and deploy process | GitHub Actions |
| ☁️ **4. Cloud Deployment** | Deployed container to AWS (EC2/ECS) | AWS, Docker Hub |
| 📊 **5. Monitoring (Optional)** | Added observability for real-time performance tracking | Prometheus, Grafana |

---

## 🧰 Tech Stack
- **Frontend:** React (Create React App)
- **Containerization:** Docker
- **Orchestration:** Docker Compose
- **CI/CD:** GitHub Actions
- **Cloud:** AWS (EC2 or ECS)
- **Monitoring:** Prometheus + Grafana *(optional step)*

---

## 🏗️ Local Development

### 1️⃣ Clone Repository
```bash
git clone https://github.com/<your-username>/weather-dashboard-devops-pipeline.git
cd weather-dashboard-devops-pipeline
````

### 2️⃣ Install Dependencies

```bash
yarn install
```

### 3️⃣ Run Locally (Dev Mode)

```bash
yarn start
```

Visit [http://localhost:3000](http://localhost:3000)

---

## 🐳 Docker Setup

### Build Docker Image

```bash
docker build -t weather-dashboard .
```

### Run Container

```bash
docker run -d -p 8080:80 weather-dashboard
```

Visit [http://localhost:8080](http://localhost:8080)

---

## ⚙️ Docker Compose Setup

For multi-container setup (frontend + reverse proxy):

```bash
docker-compose up --build
```

---

## 🚀 CI/CD Pipeline (GitHub Actions)

Your `.github/workflows/ci.yml` will:

1. Run tests and lint checks
2. Build production code
3. Build Docker image
4. Push image to **Docker Hub**
5. SSH or deploy automatically to **AWS EC2/ECS**

---

## ☁️ Cloud Deployment

* **Option 1:** Deploy Docker image to **AWS EC2** (via SSH and GitHub Actions)
* **Option 2:** Push Docker image to **ECR** and deploy with **ECS Fargate**
* Add **custom domain** and **HTTPS** using Cloudflare or Route 53 + ACM.

---

## 📊 (Optional) Monitoring Setup

After deployment, add:

* **Prometheus** → collects metrics
* **Grafana** → visualizes dashboards
* **Alerts** → Slack/Email notifications for downtime

---

## 📦 Folder Structure

```
weather-dashboard-devops-pipeline/
│
├── public/
├── src/
├── .github/workflows/ci.yml
├── .dockerignore
├── Dockerfile
├── docker-compose.yml
├── package.json
└── README.md
```

---

## 🧩 Project Roadmap

* [x] Dockerize the app
* [x] Add Docker Compose
* [x] Configure GitHub Actions CI/CD
* [x] Deploy to AWS Cloud
* [ ] Add Monitoring and Alerts

---

## 🧠 About This Project

This is part of my **DevOps engineering journey** — going from code to cloud using real-world tools and best practices.
Follow my progress on **X (Twitter)** → [@Abdulraheem183](https://x.com/Abdulraheem183)

---

## 📜 License

MIT License © 2025 Abdul Raheem
