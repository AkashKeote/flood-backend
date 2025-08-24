#!/usr/bin/env python3
"""
verify_deployment.py - Check if all files are ready for deployment
"""

import os
import sys

def check_file_exists(filepath, description):
    """Check if a required file exists"""
    if os.path.exists(filepath):
        size = os.path.getsize(filepath)
        print(f"✅ {description}: {filepath} ({size:,} bytes)")
        return True
    else:
        print(f"❌ {description}: {filepath} - MISSING!")
        return False

def main():
    print("🔍 Deployment Verification - Mumbai Flood API")
    print("=" * 50)
    
    all_good = True
    
    # Check core files
    files_to_check = [
        ("api/index.py", "Flask application"),
        ("api/llload.py", "Core logic"),
        ("api/mumbai_ward_area_floodrisk.csv", "Flood risk data"),
        ("api/roads_all.graphml", "Road network data"),
        ("requirements.txt", "Python dependencies"),
        ("Procfile", "Railway/Heroku startup"),
        ("runtime.txt", "Python version"),
        ("Dockerfile", "Docker configuration"),
        ("README.md", "Documentation"),
        ("DUAL_DEPLOY.md", "Deployment guide"),
    ]
    
    for filepath, description in files_to_check:
        if not check_file_exists(filepath, description):
            all_good = False
    
    print("\n📊 File Size Analysis:")
    if os.path.exists("api/roads_all.graphml"):
        size_mb = os.path.getsize("api/roads_all.graphml") / (1024 * 1024)
        print(f"📈 Graph file: {size_mb:.1f} MB")
        if size_mb > 100:
            print("⚠️  Large file - good for Railway/Render, too big for Vercel")
        else:
            print("✅ File size acceptable for all platforms")
    
    print("\n🔧 Configuration Check:")
    
    # Check Procfile content
    if os.path.exists("Procfile"):
        with open("Procfile", "r") as f:
            procfile_content = f.read().strip()
        if "gunicorn" in procfile_content:
            print("✅ Procfile has gunicorn command")
        else:
            print("⚠️  Procfile missing gunicorn command")
            all_good = False
    
    # Check requirements.txt
    if os.path.exists("requirements.txt"):
        with open("requirements.txt", "r") as f:
            requirements = f.read()
        required_packages = ["flask", "osmnx", "pandas", "folium", "gunicorn"]
        missing_packages = [pkg for pkg in required_packages if pkg not in requirements.lower()]
        if missing_packages:
            print(f"⚠️  Missing packages in requirements.txt: {missing_packages}")
            all_good = False
        else:
            print("✅ All required packages in requirements.txt")
    
    print(f"\n{'=' * 50}")
    if all_good:
        print("🎉 ALL CHECKS PASSED! Ready for deployment!")
        print("\n🚀 Next Steps:")
        print("1. Run: deploy-both.bat")
        print("2. Or manually push to GitHub and deploy on Railway/Render")
        print("\n🌐 Platforms:")
        print("• Railway: https://railway.app (Recommended)")
        print("• Render: https://render.com (Alternative)")
    else:
        print("❌ SOME ISSUES FOUND! Please fix them before deployment.")
        return 1
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
