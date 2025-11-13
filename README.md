# Creating-Linux-Environment-with-Docker

A lightweight and customizable **Linux environment for running Bash scripts, Python scripts, and n8n CLI workflows**, fully isolated inside a Docker container.

This setup is ideal for:

- Running Python or Shell scripts on demand  
- Executing `n8n` workflows via CLI  
- Testing automations safely  
- Having a clean Linux workspace on Windows or macOS  
- Avoiding dependency conflicts on the host machine  

Nothing runs automatically — the environment only starts when you choose to start it.

---

## 🚀 Features

- Ubuntu 22.04 base system  
- Python 3 + Pip  
- Bash and essential Linux utilities  
- Node.js 20 LTS  
- n8n CLI installed globally  
- Cron installed (empty – no scheduled tasks)  
- Scripts and logs mounted via Docker volumes  
- Fully interactive shell environment  

---

## 📁 Folder Structure  

```
Linux_Environment/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── scripts/ ← your .sh and .py scripts go here
└── logs/ ← runtime logs (if needed)
```

---

## 🛠 Requirements

- Docker  
- (Optional) Docker Compose v2+  

---

## ▶️ Start the Environment

### Before starting the container, you must download or clone this repository.

#### 📥 Option 1 — Clone the repository (recommended)
```bash
git clone https://github.com/YOUR_USERNAME/Creating-Linux-Environment-with-Docker.git
cd Creating-Linux-Environment-with-Docker
```

#### 📦 Option 2 — Download as ZIP

Go to the repository page on GitHub

Click Code → Download ZIP

Extract the ZIP file

Open a terminal inside the extracted folder  


### ▶️ Start the Docker Environment

#### Build and start:  
```bash
docker-compose up --build
```  
#### Start without rebuilding:  
```bash
docker-compose up
```  
#### Detached mode:  
```bash
docker-compose up -d
```
## 💻 Entering the Linux Shel
If the container is running:
```bash
docker exec -it n8n-cli-env /bin/bash
```
You will now be inside a full Linux environment.  

## 📜 Running Automation Scripts
### Bash script:
```bash
/scripts/myscript.sh
```
### Python script:
```bash
python3 /scripts/myscript.py
```
### n8n workflow by ID:
```bash
n8n execute --id=5
```
  
## 🧹 Stopping the Environment
```bash
docker-compose down
```
  
## 🧩 Customization

You can extend this environment by adding additional packages in the Dockerfile, such as:

- PostgreSQL client

- Extra Python libraries

- Yarn, PNPM, or global Node packages

- System utilities

Just modify the Dockerfile and rebuild the image.  

## 📜 License
MIT License — feel free to use, modify, and distribute.

