# Mumbai Flood Risk API - Docker Version

A Flask API for generating evacuation routes based on flood risk data in Mumbai, optimized for Docker deployment.

## 🚀 Quick Start with Docker

### Prerequisites
- Docker Desktop installed and running
- Git (for deployment to Render)

### 1. Build Docker Image
```bash
# Make sure Docker Desktop is running first!
docker build -t flood-risk-api .
```

### 2. Test Locally
```bash
docker run -p 5000:5000 flood-risk-api
```

### 3. Access API
- **Home**: http://localhost:5000
- **Health Check**: http://localhost:5000/health
- **Regions List**: http://localhost:5000/regions
- **Generate Map**: http://localhost:5000/map?region=Andheri

## 🌐 Deploy to Render

### Step 1: Push to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

### Step 2: Deploy on Render
1. Go to [render.com](https://render.com)
2. Create new **Web Service**
3. Connect your GitHub repository
4. Use these settings:
   - **Environment**: `Docker`
   - **Region**: Choose closest to your users
   - **Branch**: `main`
   - **Build Command**: Leave empty
   - **Start Command**: Leave empty (uses Dockerfile)
   - **Instance Type**: Free or paid based on needs

### Step 3: Environment Variables (Optional)
- `PORT`: Automatically set by Render
- Add any custom environment variables if needed

## 📁 Project Structure

```
flood-backend/
├── api/
│   ├── index.py                          # Main Flask application
│   ├── llload.py                        # Core logic for route generation  
│   ├── mumbai_ward_area_floodrisk.csv   # Flood risk data (5KB)
│   └── roads_all.graphml                # Road network data (39MB)
├── Dockerfile                           # Docker configuration
├── requirements.txt                     # Python dependencies
├── .dockerignore                       # Docker ignore rules
├── docker-deploy.bat                   # Windows deployment script
└── README.md                           # This file
```

## 🔧 API Endpoints

### GET `/`
Returns API information and available endpoints.

**Response:**
```json
{
  "message": "Mumbai Flood Risk API - Docker Version",
  "status": "running", 
  "endpoints": {
    "/map": "GET - Generate evacuation map",
    "/regions": "GET - List all available regions",
    "/health": "GET - Health check"
  }
}
```

### GET `/health`
Health check endpoint with system information.

**Response:**
```json
{
  "status": "healthy",
  "data_loaded": true,
  "graph_nodes": 38162,
  "regions_count": 24
}
```

### GET `/regions`
Returns list of all available Mumbai regions.

**Response:**
```json
{
  "regions": ["Andheri East", "Bandra West", "Dadar", ...],
  "count": 24
}
```

### GET `/map?region=<region_name>`
Generates an interactive evacuation map for the specified region.

**Parameters:**
- `region` (required): Name of the Mumbai region

**Example:**
```
GET /map?region=Andheri
```

**Response:** Interactive HTML map with evacuation routes

## 🐳 Docker Commands

### Build Image
```bash
docker build -t flood-risk-api .
```

### Run Container
```bash
# Run on port 5000
docker run -p 5000:5000 flood-risk-api

# Run in background
docker run -d -p 5000:5000 --name flood-api flood-risk-api

# Run with custom port
docker run -p 8080:5000 -e PORT=5000 flood-risk-api
```

### Stop Container
```bash
docker stop flood-api
docker rm flood-api
```

### View Logs
```bash
docker logs flood-api
```

## 📋 Development

### Local Development (without Docker)
```bash
# Install dependencies
pip install -r requirements.txt

# Run locally
python api/index.py
```

### File Size Information
- **Total project**: ~45MB
- **roads_all.graphml**: 39MB (road network data)
- **mumbai_ward_area_floodrisk.csv**: 5KB (flood risk data)
- **Python code**: <50KB

## 🚨 Troubleshooting

### Docker Desktop Not Running
```
ERROR: error during connect: Head "http://%2F%2F.%2Fpipe%2FdockerDesktopLinuxEngine/_ping"
```
**Solution**: Start Docker Desktop application

### Memory Issues
If you encounter memory issues on free tier:
- Consider using paid tier
- Or optimize the graph data by reducing `SAMPLE_FACTOR` in `llload.py`

### Build Fails
- Check Docker Desktop is running
- Ensure all files are present in correct directories
- Check internet connection for downloading dependencies

## 🌟 Features

- **Risk-colored road visualization**
- **Multiple evacuation route suggestions**
- **POI (Points of Interest) integration**
- **Interactive maps with folium**
- **Fuzzy string matching for region names**
- **Dockerized for easy deployment**
- **Health monitoring endpoints**

## 📊 Data Sources

- **Road Network**: OpenStreetMap via OSMnx
- **Flood Risk Data**: Mumbai ward-wise flood risk assessment
- **POIs**: Hospitals, police stations, emergency services via OSMnx

## 🔗 Deployment URLs

After deploying to Render, your API will be available at:
```
https://your-app-name.onrender.com
```

Example endpoints:
```
https://your-app-name.onrender.com/health
https://your-app-name.onrender.com/regions  
https://your-app-name.onrender.com/map?region=Bandra
```
