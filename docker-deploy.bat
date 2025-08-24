@echo off
echo 🐳 Mumbai Flood Risk API - Docker Deployment
echo ==========================================

echo ✅ Building Docker image...
docker build -t flood-risk-api .

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Docker build failed!
    exit /b 1
)

echo ✅ Docker image built successfully!
echo.

echo 🚀 Testing locally (optional)...
echo Run this command to test locally:
echo docker run -p 5000:5000 flood-risk-api
echo.

echo 📝 To deploy to Render:
echo 1. Push your code to GitHub
echo 2. Connect GitHub repo to Render
echo 3. Use these settings:
echo    - Environment: Docker
echo    - Build Command: (leave empty)
echo    - Start Command: (leave empty, uses Dockerfile CMD)
echo    - Port: 5000
echo.

echo 🌐 Your API endpoints will be:
echo    GET  /              - API information
echo    GET  /health        - Health check  
echo    GET  /regions       - List all regions
echo    GET  /map?region=X  - Generate evacuation map
