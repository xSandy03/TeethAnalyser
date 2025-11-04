# Dental AI - Detection, Depth, Decision

A dental image analysis application that uses AI to analyze dental X-rays, detect cavities, and recommend treatment options.

## Features

- 🦷 **Tooth Detection**: Identifies number of teeth and names them according to FDI system
- 🔍 **Cavity Detection**: Detects caries and assesses cavity density
- 📏 **Depth Analysis**: Checks depth of caries and identifies pulpal involvement
- 💡 **Treatment Recommendations**: Suggests root canal treatment or extraction based on condition
- 🤖 **AI-Powered**: Uses GPT-4 Vision for analysis
- 🔬 **ML Model**: Includes manual ML model for treatment prediction (optional)

## Quick Start (Local Development)

### Prerequisites

- Python 3.8+
- OpenAI API key ([Get one here](https://platform.openai.com/api-keys))

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd Dental-AI---Detection-Depth-Decision-main
   ```

2. **Create virtual environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set OpenAI API key**
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   ```

5. **Start the server**
   ```bash
   python app.py
   ```
   Or use the startup script:
   ```bash
   ./start_server.sh
   ```

6. **Access the application**
   - Open your browser and go to: `http://localhost:12355/`
   - **Important**: Do NOT open the HTML file directly (file://)

### Testing

- Health check: `http://localhost:12355/health`
- Main interface: `http://localhost:12355/`

## Deployment

### Option 1: GitHub Pages + Backend Service

#### Deploy Backend (Render - Free)

1. Go to [Render.com](https://render.com) and sign up
2. Create a new **Web Service**
3. Connect your GitHub repository
4. Configure:
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app --host 0.0.0.0 --port $PORT`
   - **Environment Variables**: `OPENAI_API_KEY` = your key
5. Note your Render URL (e.g., `https://your-app.onrender.com`)

#### Deploy Frontend (GitHub Pages)

1. Use `index_github_pages.html` as your frontend
2. Rename it to `index.html` or keep both
3. Push to GitHub:
   ```bash
   git add .
   git commit -m "Deploy to GitHub Pages"
   git push
   ```
4. Enable GitHub Pages:
   - Repository → Settings → Pages
   - Source: `main` branch, `/ (root)`
   - Your site: `https://YOUR_USERNAME.github.io/YOUR_REPO/`
5. Configure the API URL in the web interface with your Render backend URL

### Option 2: Render (All-in-One)

Deploy both frontend and backend on Render:
- Backend: Web Service (Flask)
- Frontend: Static Site (HTML file)

## Project Structure

```
.
├── app.py                    # Flask backend server
├── index.html                # Frontend (for local Flask server)
├── index_github_pages.html   # Frontend (for GitHub Pages)
├── requirements.txt          # Python dependencies
├── start_server.sh          # Startup script
└── README.md                # This file
```

## API Endpoints

- `GET /` - Serves the HTML interface
- `GET /health` - Health check endpoint
- `POST /upload` - Upload and analyze dental image

## Troubleshooting

### "Error connecting to server"
- Make sure Flask server is running (`python app.py`)
- Check if port 12355 is available
- Access via `http://localhost:12355/` (not file://)

### "OpenAI API key missing"
- Set `OPENAI_API_KEY` environment variable
- Or add it directly in `app.py` (not recommended for production)

### "Port already in use"
- Kill existing process: `pkill -f "python.*app.py"`
- Or change port in `app.py` (line 152)

### CORS Errors
- Make sure CORS is enabled in `app.py` (already configured)
- Access via server URL, not file://

## Configuration

### Environment Variables

- `OPENAI_API_KEY` - Required for GPT-4 analysis

### Manual Model Paths

The manual ML model looks for training data in:
- `/opt/tooth_analyzer/extraction/` - Images for extraction cases
- `/opt/tooth_analyzer/rootcanal/` - Images for root canal cases

These are optional - the app works without them.

## Technologies Used

- **Backend**: Flask, Python
- **AI**: OpenAI GPT-4 Vision
- **ML**: scikit-learn, OpenCV, NumPy
- **Frontend**: HTML, CSS, JavaScript

## License

[Add your license here]

## Contributing

[Add contribution guidelines here]
