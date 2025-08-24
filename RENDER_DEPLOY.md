# 🚀 Render Deployment Guide

## Step-by-Step Instructions

### 1. Prepare Your Code
✅ Docker files ready
✅ Requirements.txt updated  
✅ Flask app configured for production

### 2. Push to GitHub
```bash
# Initialize git (if not done already)
git init

# Add all files
git add .

# Commit changes
git commit -m "Docker version ready for Render deployment"

# Add your GitHub repository
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Push to GitHub
git push -u origin main
```

### 3. Deploy on Render
1. Go to **https://render.com**
2. Sign up/Login with GitHub
3. Click **"New +"** → **"Web Service"**
4. Connect your GitHub repository
5. Use these exact settings:

```
Name: flood-risk-api (or your choice)
Environment: Docker
Region: Singapore (closest to India)
Branch: main
Build Command: (leave empty)
Start Command: (leave empty)
Instance Type: Free (or paid for better performance)
```

### 4. Environment Variables (Optional)
No environment variables needed for basic setup.

### 5. Deploy!
Click **"Create Web Service"** and wait 5-10 minutes.

## 🎯 Expected Results

Your API will be live at:
```
https://flood-risk-api-XXXX.onrender.com
```

Test endpoints:
- **Health**: `https://your-app.onrender.com/health`
- **Regions**: `https://your-app.onrender.com/regions`
- **Map**: `https://your-app.onrender.com/map?region=Andheri`

## 🐛 Troubleshooting

### Build Failed
- Check Dockerfile syntax
- Ensure all files are committed to git
- Check requirements.txt

### Memory Issues
- Upgrade to paid tier ($7/month)
- Or reduce `SAMPLE_FACTOR` in llload.py

### Cold Starts
- Free tier sleeps after 15 minutes
- Paid tier has no cold starts

## 📞 Support
If deployment fails, check Render build logs for specific errors.
