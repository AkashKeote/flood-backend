@echo off
echo 🚀 Mumbai Flood API - Dual Platform Deployment
echo =============================================

echo.
echo 📋 Pre-deployment Checklist:
echo ✅ Files ready
echo ✅ Git repository initialized
echo ✅ Changes committed
echo.

echo 🔗 GitHub Repository Setup:
echo 1. Go to github.com and create new repository
echo 2. Repository name: flood-backend (or your choice)
echo 3. Make it PUBLIC
echo 4. DO NOT initialize with README (we already have files)
echo 5. Copy the repository URL
echo.

set /p GITHUB_URL="Enter your GitHub repository URL (https://github.com/username/repo.git): "

if "%GITHUB_URL%"=="" (
    echo ❌ GitHub URL required!
    pause
    exit /b 1
)

echo.
echo 📤 Pushing to GitHub...
git remote remove origin 2>nul
git remote add origin %GITHUB_URL%
git branch -M main
git push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo ❌ GitHub push failed! Check your repository URL and permissions.
    pause
    exit /b 1
)

echo ✅ Successfully pushed to GitHub!
echo.

echo 🚂 Railway Deployment Steps:
echo 1. Go to: https://railway.app
echo 2. Sign up/Login with GitHub
echo 3. Click "New Project"
echo 4. Select "Deploy from GitHub repo"
echo 5. Choose your flood-backend repository
echo 6. Click Deploy!
echo.

echo 🟢 Render Deployment Steps (Alternative):
echo 1. Go to: https://render.com  
echo 2. Sign up/Login with GitHub
echo 3. Click "New Web Service"
echo 4. Connect your flood-backend repository
echo 5. Settings:
echo    - Environment: Python 3
echo    - Build Command: pip install -r requirements.txt
echo    - Start Command: gunicorn --bind 0.0.0.0:$PORT api.index:app
echo 6. Click "Create Web Service"
echo.

echo 🎯 Expected Results:
echo Railway URL: https://your-app.up.railway.app
echo Render URL: https://your-app.onrender.com
echo.

echo 🧪 Test Endpoints (after deployment):
echo /health - Health check
echo /regions - List Mumbai regions  
echo /map?region=Andheri - Generate evacuation map
echo.

echo ✅ Deployment setup complete!
echo Choose either Railway OR Render for deployment.
echo Railway is recommended for faster performance.
echo.

pause
