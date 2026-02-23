# Self-hosted ShareLaTeX (Overleaf CE) with Full TeX Live

A ready-to-deploy ShareLaTeX stack with:
- Full TeX Live installation (all packages included)
- Automatic weekly package updates (Saturdays at 2 AM in your configured timezone)
- MongoDB + Redis included

## Requirements

- A machine running Docker
- Portainer (recommended) or plain Docker Compose

## Setup

### 1. Clone the repo
```bash
git clone https://github.com/GaizFenix/sharelatex-dockerized-portainer.git
cd sharelatex-dockerized-portainer
```

### 2. Configure your environment
```bash
cp .env.example .env
```
Open `.env` and fill in your values (site URL, app name, timezone, etc.).

### 3. Deploy

**Via Portainer (recommended):**
1. Go to **Stacks → Add Stack → Git Repository**
2. Enter the repo URL and branch
3. Set the Compose path to `docker-compose.yaml`
4. Add your `.env` contents under **Environment variables**
5. Click **Deploy the stack**

> ⚠️ The first deploy takes a while — the full TeX Live install (~4–7 GB) runs at build time.

**Via command line:**
```bash
docker compose up -d --build
```

### 4. Create your admin account
Once running, visit `http://your-server/launchpad` to create the first admin user.

## Updating TeX packages manually
```bash
docker exec sharelatex tlmgr update --all
```

## Changing the update schedule
Edit `cron/tlmgr-update` and change the cron expression, then redeploy.

## Data
All data is stored in named Docker volumes (`sharelatex_data`, `mongo_data`, `redis_data`).
Redeploying or rebuilding the image will **never delete your data**.
