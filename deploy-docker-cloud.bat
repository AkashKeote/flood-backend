@echo off
echo 🐳 Cloud Docker Deployment - Mumbai Flood API
echo ===============================================

echo.
echo 🚨 Local Docker Issues Detected!
echo Docker Desktop not running properly due to memory constraints.
echo.

echo 🌊 RECOMMENDED: DigitalOcean App Platform
echo ==========================================
echo 1. Go to: https://digitalocean.com
echo 2. Sign up (get $200 free credit!)
echo 3. Apps → Create App
echo 4. Connect GitHub: AkashKeote/flood-backend
echo 5. Dockerfile will be auto-detected
echo 6. Deploy! (10-15 minutes)
echo.
echo Expected URL: https://flood-backend-XXXXX.ondigitalocean.app
echo Cost: $5/month basic plan
echo.

echo 🟣 ALTERNATIVE: Heroku Container
echo =================================
echo 1. Install: npm install -g heroku
echo 2. Login: heroku login
echo 3. Create: heroku create mumbai-flood-docker
echo 4. Set stack: heroku stack:set container
echo 5. Deploy: git push heroku main
echo.

echo 🔷 ALTERNATIVE: Google Cloud Run
echo ==================================
echo 1. Install Google Cloud CLI
echo 2. Set project: gcloud config set project YOUR_PROJECT
echo 3. Build: gcloud builds submit --tag gcr.io/PROJECT/flood-api
echo 4. Deploy: gcloud run deploy --image gcr.io/PROJECT/flood-api
echo.

echo.
echo 💡 QUICK DECISION HELPER:
echo • Want easiest? → DigitalOcean (web interface)
echo • Want free tier? → Railway/Render (non-Docker)
echo • Want enterprise? → Google Cloud Run
echo • Want familiar? → Heroku
echo.

set /p choice="Choose deployment method (d=DigitalOcean, h=Heroku, g=Google, r=Railway): "

if /i "%choice%"=="d" (
    echo.
    echo 🌊 Opening DigitalOcean...
    start https://digitalocean.com
    echo.
    echo Steps:
    echo 1. Sign up and verify account
    echo 2. Apps → Create App → GitHub
    echo 3. Select: AkashKeote/flood-backend
    echo 4. Auto-detects Dockerfile → Deploy
    echo.
    echo ⏱️ Build time: 10-15 minutes
    echo 💰 Cost: $5/month
    echo.
)

if /i "%choice%"=="h" (
    echo.
    echo 🟣 Heroku Container Deployment...
    echo.
    echo Installing Heroku CLI...
    npm install -g heroku
    
    echo.
    echo Please run these commands manually:
    echo heroku login
    echo heroku create mumbai-flood-docker
    echo heroku stack:set container -a mumbai-flood-docker
    echo git push heroku main
    echo.
)

if /i "%choice%"=="g" (
    echo.
    echo 🔷 Google Cloud Run requires:
    echo 1. Google Cloud account with billing enabled
    echo 2. Google Cloud CLI installed
    echo 3. Project created in console
    echo.
    echo Opening Google Cloud Console...
    start https://console.cloud.google.com
    echo.
)

if /i "%choice%"=="r" (
    echo.
    echo 🚂 Railway (Non-Docker) - Recommended alternative!
    echo.
    echo Opening Railway...
    start https://railway.app
    echo.
    echo Steps:
    echo 1. Sign up with GitHub
    echo 2. New Project → Deploy from GitHub
    echo 3. Select: AkashKeote/flood-backend
    echo 4. Auto-deploys Python app (5-8 minutes)
    echo.
    echo ✅ No Docker needed, works with your current setup!
    echo.
)

echo.
echo 📝 Current Repository: https://github.com/AkashKeote/flood-backend
echo ✅ Code is ready for deployment on any platform!
echo.

pause
