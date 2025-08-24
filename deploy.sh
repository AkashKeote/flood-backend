#!/bin/bash

echo "🚀 Mumbai Flood Risk API - Vercel Deployment Script"
echo "=================================================="

# Check if vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI not found. Installing..."
    npm install -g vercel
fi

# Check if we're in the right directory
if [ ! -f "vercel.json" ]; then
    echo "❌ vercel.json not found. Make sure you're in the project root directory."
    exit 1
fi

echo "✅ Found vercel.json"

# Check if required files exist
if [ ! -f "api/index.py" ]; then
    echo "❌ api/index.py not found"
    exit 1
fi

if [ ! -f "api/llload.py" ]; then
    echo "❌ api/llload.py not found"
    exit 1
fi

if [ ! -f "api/mumbai_ward_area_floodrisk.csv" ]; then
    echo "❌ api/mumbai_ward_area_floodrisk.csv not found"
    exit 1
fi

if [ ! -f "api/roads_all.graphml" ]; then
    echo "❌ api/roads_all.graphml not found"
    exit 1
fi

echo "✅ All required files found"

# Deploy to Vercel
echo "🚀 Deploying to Vercel..."
vercel --prod

echo "✅ Deployment complete!"
echo ""
echo "📝 Your API endpoints will be:"
echo "   GET  /              - API information"
echo "   GET  /health        - Health check"
echo "   GET  /regions       - List all regions"
echo "   GET  /map?region=X  - Generate evacuation map"
echo ""
echo "🌐 Visit your Vercel dashboard to get the live URL."
