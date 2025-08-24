@echo off
echo 🚀 Mumbai Flood Risk API - Vercel Deployment Script
echo ==================================================

REM Check if vercel CLI is installed
where vercel >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Vercel CLI not found. Installing...
    npm install -g vercel
)

REM Check if we're in the right directory
if not exist "vercel.json" (
    echo ❌ vercel.json not found. Make sure you're in the project root directory.
    exit /b 1
)

echo ✅ Found vercel.json

REM Check if required files exist
if not exist "api\index.py" (
    echo ❌ api\index.py not found
    exit /b 1
)

if not exist "api\llload.py" (
    echo ❌ api\llload.py not found
    exit /b 1
)

if not exist "api\mumbai_ward_area_floodrisk.csv" (
    echo ❌ api\mumbai_ward_area_floodrisk.csv not found
    exit /b 1
)

if not exist "api\roads_all.graphml" (
    echo ❌ api\roads_all.graphml not found
    exit /b 1
)

echo ✅ All required files found

REM Deploy to Vercel
echo 🚀 Deploying to Vercel...
vercel --prod

echo ✅ Deployment complete!
echo.
echo 📝 Your API endpoints will be:
echo    GET  /              - API information
echo    GET  /health        - Health check
echo    GET  /regions       - List all regions
echo    GET  /map?region=X  - Generate evacuation map
echo.
echo 🌐 Visit your Vercel dashboard to get the live URL.
