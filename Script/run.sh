#!/bin/bash
set -e  # Exit immediately on error

echo "✅ Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "✅ Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Installing browser drivers via rfbrowser..."
rfbrowser init

echo "✅ Creating Results directory..."
mkdir -p Results

echo "✅ Running Robot Framework tests..."
robot -d Results -L TRACE Tests/

echo "✅ Cleaning up virtual environment..."
deactivate
rm -rf venv

echo "✅ Done!"