#!/bin/bash
# Script to start the Flask server
cd "$(dirname "$0")"
source venv/bin/activate
echo "Starting Flask server on http://localhost:12355"
echo "Make sure to set OPENAI_API_KEY if you haven't already:"
echo "  export OPENAI_API_KEY='your-api-key-here'"
echo ""
python app.py

