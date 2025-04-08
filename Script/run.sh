#!/bin/bash
set -e

# Ensure Node.js and npm are available for rfbrowser
export PATH=$PATH:/opt/homebrew/bin   # Adjust this if your node path is different

echo "🟢 Node version:"
node -v
npm -v

# Rest of your script
echo "✅ Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "✅ Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Initializing rfbrowser..."
rfbrowser init

echo "✅ Running Robot Framework tests..."
mkdir -p Results
robot -d Results -L TRACE Tests/

echo "✅ Cleaning up..."
deactivate
rm -rf venv