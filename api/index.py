from flask import Flask, request, jsonify
import tempfile
import os
import gc  # For memory cleanup
import sys

# Add current directory to Python path for imports
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Import llload module (this will work now)
from llload import get_k_nearest_low_risk_routes, build_and_save_map, flood_df, G

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "Mumbai Flood Risk API - Optimized Version",
        "status": "running",
        "endpoints": {
            "/map": "GET - Generate evacuation map for a region (requires ?region= parameter)",
            "/regions": "GET - List all available regions", 
            "/health": "GET - Health check"
        }
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy", 
        "data_loaded": len(flood_df) > 0,
        "graph_nodes": len(G.nodes),
        "regions_count": len(flood_df)
    })

@app.route("/regions")
def regions():
    try:
        regions_list = flood_df["areas"].unique().tolist()
        return jsonify({
            "regions": regions_list,
            "count": len(regions_list)
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/map")
def map_page():
    try:
        # get region from query string ?region=
        region = request.args.get("region", "")
        if not region:
            return jsonify({"error": "Region not provided. Use ?region=<region_name>"}), 400

        matched, score, routes = get_k_nearest_low_risk_routes(region, G, flood_df, k=5)
        if not matched or not routes:
            return jsonify({
                "error": f"Could not generate map for '{region}'",
                "matched_region": matched,
                "score": score
            }), 404

        # Save map temporarily and return HTML content
        tmp_file = tempfile.NamedTemporaryFile(suffix=".html", delete=False)
        build_and_save_map(matched, routes, tmp_file.name)
        tmp_file.flush()

        # Read the HTML content
        with open(tmp_file.name, 'r', encoding='utf-8') as f:
            html_content = f.read()
        
        # Clean up temp file and memory
        os.unlink(tmp_file.name)
        gc.collect()  # Force garbage collection to free memory

        # Return HTML content directly
        return html_content, 200, {'Content-Type': 'text/html; charset=utf-8'}
        
    except Exception as e:
        return jsonify({"error": f"Internal server error: {str(e)}"}), 500

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=False)
