# 🤖 Robot Framework E2E Testing with Browser Library

This repository contains automated end-to-end (E2E) tests using **Robot Framework** and the modern **Browser Library** (built on top of Playwright).

## 📦 Project Structure

robot-tests/
├── Tests/                # Test cases written in .robot files
│   └── example.robot
├── Resources/            # Reusable import library and test data
│   └── import.robot
├── Keywords/             # Reusable keywords or variables
│   └── common_keywords.robot  
├── Results/              # Output files (created after test execution)
├── README.md             # Project documentation
└── requirements.txt      # Python dependencies

## 🚀 Getting Started

1. 🧩 Install Node.js

Make sure [Node.js](https://nodejs.org/) is installed on your system (required by Playwright).

```bash
node -v
npm -v

2. 🐍 Create and Activate Virtual Environment
On macOS/Linux:
    python3 -m venv venv
    source venv/bin/activate

On Windows:
    python -m venv venv
    venv\Scripts\activate

3. 📥 Install Python Dependencies
    pip install -r requirements.txt

4. 🧱 Install Browser Library and Playwright Browsers
    rfbrowser init

🧪 Running Tests
robot -d Results -L TRACE Test/