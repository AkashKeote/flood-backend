# 🚂 Railway Deployment Guide

## Quick Deploy Steps:

### 1. Push to GitHub
```bash
git init
git add .
git commit -m "Railway deployment ready"

# Add your GitHub repo (create one first on github.com)
git remote add origin https://github.com/YOUR_USERNAME/flood-backend.git
git push -u origin main
```

### 2. Deploy on Railway
1. Go to **railway.app**
2. Click **"Start a New Project"**
3. Choose **"Deploy from GitHub repo"**
4. Select your **flood-backend** repository
5. Railway will automatically detect Python and deploy!

## 🎯 Railway will auto-detect:
- ✅ Python project (requirements.txt)
- ✅ Procfile for startup command
- ✅ Port configuration
- ✅ Environment variables

## 🔧 Manual Configuration (if needed):
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn --bind 0.0.0.0:$PORT api.index:app`
- **Port**: `$PORT` (automatic)

## 📱 Expected Result:
Your API will be live at: `https://your-app-name.railway.app`

Test endpoints:
- `https://your-app-name.railway.app/health`
- `https://your-app-name.railway.app/regions`
- `https://your-app-name.railway.app/map?region=Andheri`

## 💰 Pricing:
- **Free tier**: $5 credit monthly (enough for development)
- **Pro**: $20/month for production apps

## ⚡ Deployment time: 3-5 minutes

---

# Alternative: Manual File Upload (if Git issues)

If GitHub push fails, you can manually upload files to Railway:

1. Create new Railway project
2. Go to **"Settings"** → **"Source"**
3. Upload ZIP file of your project
4. Deploy manually
