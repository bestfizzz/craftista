
# Craftista - Pratical Devops writeup
This repo includes the full project write-up and deployment of Craftista. It showcases how I built and ran a real-world-style microservices app using modern DevOps tools and practices.

---
## About Craftista
Craftista is a polyglot microservices-based web app designed as the perfect learning playground for DevOps projects. With services built in Node.js, Python, Java, and Go, it simulates a real-world system while remaining simple and manageable. It includes built-in unit tests, service dashboards, version tracking, and even UI for backend APIs—making it ideal for practicing containerization, CI/CD, and orchestration. 
Check out the orignial repo for more info: [GitHub Repository URL](https://github.com/craftista).

---
## Project Ides to build using this Application Repo 

Here are 10 basic projects I'll do:
  1.  Containerize with Docker: Write Dockerfiles for each of the services, and a docker compose to run it as a micro services application stack to automate dev environments. ✔️
  2.  Build CI Pipeline : Build a complete CI Pipeline using Jenkins, GitHub Actions, Azure Devops etc.  ✔️
  3.  Deploy to Kubernetes : Write kubernetes manifests to create Deployments, Services, PVCs, ConfigMaps, Statefulsets and more  
  4.  Package with Helm : Write helm charts to templatize the kubernetes manifests and prepare to deploy in different environments  
  5.  Blue/Green and Canary Releases with ArgoCD/GitOps: Setup releases strategies with Argo Rollouts Combined with ArgoCD and integrate with CI Pipeline created in 3. to setup a complete CI/CD workflow.  
  6.  Setup Observability : Setup monitoring with Prometheus and Grafana (Integrate this for automated CD with rollbacks using Argo), Setup log management with ELS/EFK Stack or Splunk.
  7.  Build a DevSecOps Pipeline: Create a DevSecOps Pipeline by adding SCA, SAST, Image Scanning, DAST, Compliance Scans, Kubernetes Scans etc. and more at each stage.
  8.  Design and Build Cloud Infra : Build Scalable, Hight Available, Resilience, Fault Tolerance Cloud Infra to host this app.
  9.  Write Terraform Templating : Automate the infra designed in project 8. Use Terragrunt on top for multi environment configurations.  
  10.  Python Scripts for Automation : Automate ad-hoc tasks using python scripts.

and 5 Advanced Projects (maybe I'll try in the future):  

  1. Deploy on EKS/AKS: Build EKS/AKS Cluster and deploy this app with helm packages you created earlier.
  2. Implement Service Mesh: Setup advanced observability, traffic management and shaping, mutual TLS, client retries and more with Istio.
  3. AIOps: On top of Observability, incorporate Machine Learning models, Falco and Argo Workflow for automated monitoring, incident response and mitigation.
  4. SRE: Implement SLIs, SLOs, SLAs on top of the project 6 and setup Site Reliability Engineering practices.  
  5. Chaos Engineering : Use LitmusChaos to test resilience of your infra built on Cloud with Kubernetes and Istio.

## 1.  Containerize with Docker
I created DockerFile for each services. For services using go or maven, the final alpine image only contains compiled executable. Later on, multiphase build are applied to DockerFile, also a seperate test phase for each. 
## 2.  Build CI Pipeline
I used Jenkins (in container) with dind(Docker-in-Docker), I also simulated docker cloud connection using socat. I created pipelines for each services including: build image, testing, deploy using docker and upload to docker hub with configured credential.
## 3.  Deploy to Kubernetes






