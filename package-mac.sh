#!/bin/sh

set -e

# Configuration
PACKAGE_NAME="JavaAppTemplate-macos"
JRE_DIR="jre-macos"
ADOPTIUM_BASE_URL="https://api.adoptium.net/v3/binary/latest/25/ga"

# Clean up any previous builds
rm -rf ${PACKAGE_NAME}
rm -rf ${JRE_DIR}
rm -f ${PACKAGE_NAME}.zip

# Build the application using Gradle
echo "Building application..."
./gradlew build

# Download JRE for macOS from Eclipse Adoptium
echo "Downloading JRE for macOS..."
mkdir -p ${JRE_DIR}
curl -L "${ADOPTIUM_BASE_URL}/mac/x64/jre/hotspot/normal/eclipse?project=jdk" -o ${JRE_DIR}/jre-macos.tar.gz

# Extract the downloaded JRE
echo "Extracting JRE..."
cd ${JRE_DIR}
tar -xzf jre-macos.tar.gz
JRE_EXTRACTED=$(ls -d jdk* 2>/dev/null || ls -d jre* 2>/dev/null)
cd ..

# Create package directory structure
echo "Creating package structure..."
mkdir -p ${PACKAGE_NAME}
cp app/build/libs/app-all.jar ${PACKAGE_NAME}/app.jar
cp README.md ${PACKAGE_NAME}/README.txt
cp LICENSE ${PACKAGE_NAME}/LICENSE

# Copy the JRE into the package
echo "Copying JRE into package..."
cp -r ${JRE_DIR}/${JRE_EXTRACTED} ${PACKAGE_NAME}/jre

# Create a shell script that uses the bundled JRE (macOS JRE structure: Contents/Home)
cat > ${PACKAGE_NAME}/run.sh << 'EOF'
#!/bin/sh

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}/jre/Contents/Home/bin/java" -jar "${SCRIPT_DIR}/app.jar"
EOF

# Make the run script executable
chmod +x ${PACKAGE_NAME}/run.sh

# Create the final zip archive with maximum compression
echo "Creating zip archive..."
zip -9 -r ${PACKAGE_NAME}.zip ${PACKAGE_NAME}/

# Clean up temporary directories
rm -rf ${PACKAGE_NAME}
rm -rf ${JRE_DIR}

echo ""
echo "✓ macOS package with bundled JRE created: ${PACKAGE_NAME}.zip"
echo ""