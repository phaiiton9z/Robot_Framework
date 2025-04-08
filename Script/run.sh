#!/bin/bash
set -e

# Default BUILD_NUMBER if not running from Jenkins
if [ -z "$BUILD_NUMBER" ]; then
  BUILD_NUMBER=0
fi

export PATH=$PATH:/opt/homebrew/bin

echo "🟢 Node version:"
node -v
npm -v

echo "✅ Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "✅ Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Initializing rfbrowser..."
rfbrowser init

# Set up result folder
RESULTS_DIR="Results_${BUILD_NUMBER}"
mkdir -p "$RESULTS_DIR"

# Clean up older builds (keep latest 5)
ls -dt Results_* | grep -v "$RESULTS_DIR" | tail -n +6 | xargs -r rm -rf

# Handle tag filters
TAGS=("$@")
TAG_ARGS=""
if [ ${#TAGS[@]} -gt 0 ]; then
    echo "🏷️ Running tests with tags: ${TAGS[*]}"
    for tag in "${TAGS[@]}"; do
        TAG_ARGS+="--include $tag "
    done
else
    echo "🧪 No tags provided — running all tests"
fi

# 🔁 1st run
echo "🚀 Running first Robot test run..."
robot -d "$RESULTS_DIR" -v headless:true -L TRACE ${TAG_ARGS} Tests/

# ✅ Check if any tests failed
if grep -q 'status="FAIL"' "$RESULTS_DIR/output.xml"; then
    echo "🔁 Some tests failed — re-running failed tests..."
    
    # Run only failed tests
    robot --rerunfailed "$RESULTS_DIR/output.xml" -d "$RESULTS_DIR/rerun" -L TRACE ${TAG_ARGS} Tests/

    # Merge results
    echo "🧬 Merging original and rerun results..."
    rebot --output "$RESULTS_DIR/output.xml" --log "$RESULTS_DIR/log.html" --report "$RESULTS_DIR/report.html" \
          "$RESULTS_DIR/output.xml" "$RESULTS_DIR/rerun/output.xml"
else
    echo "✅ All tests passed on first run — no rerun needed."
fi

# Clean up
echo "🧹 Cleaning virtualenv..."
deactivate
rm -rf venv

echo "✅ Final merged results in: $RESULTS_DIR"