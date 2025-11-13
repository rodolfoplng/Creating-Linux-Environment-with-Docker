# Base Linux image
FROM ubuntu:22.04

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# ---------------------------------------------
# 1. Install essential system packages
# ---------------------------------------------
RUN apt update && apt install -y \
    bash \
    curl \
    wget \
    git \
    nano \
    vim \
    unzip \
    sudo \
    cron \
    python3 \
    python3-pip \
    build-essential \
    && apt clean

# ---------------------------------------------
# 2. Install Node.js (LTS 20.x)
# ---------------------------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt install -y nodejs

# Print installed versions
RUN node -v && npm -v

# ---------------------------------------------
# 3. Install n8n CLI globally via NPM
# ---------------------------------------------
RUN npm install -g n8n

# Verify installation
RUN n8n --version

# ---------------------------------------------
# 4. Create directories for scripts and logs
# ---------------------------------------------
RUN mkdir -p /scripts /logs

# Copy user scripts into the container (optional)
COPY scripts/ /scripts/
RUN chmod -R +x /scripts

# ---------------------------------------------
# 5. Initialize cron service with an empty crontab
#    (No automatic jobs will run)
# ---------------------------------------------
RUN touch /etc/cron.d/empty-cron && chmod 0644 /etc/cron.d/empty-cron && crontab /etc/cron.d/empty-cron

# ---------------------------------------------
# 6. Start cron and open an interactive shell
# ---------------------------------------------
CMD cron && /bin/bash
