#!/bin/sh

set -e

# Configuration
PACKAGE_NAME="JavaAppTemplate-windows"
JRE_DIR="jre-windows"
ADOPTIUM_BASE_URL="https://api.adoptium.net/v3/binary/latest/25/ga"

# Clean up any previous builds
rm -rf ${PACKAGE_NAME}
rm -rf ${JRE_DIR}
rm -f ${PACKAGE_NAME}.zip

# Build the application using Gradle
echo "Building application..."
./gradlew build

# Download JRE for Windows from Eclipse Adoptium
echo "Downloading JRE for Windows..."
mkdir -p ${JRE_DIR}
curl -L "${ADOPTIUM_BASE_URL}/windows/x64/jre/hotspot/normal/eclipse?project=jdk" -o ${JRE_DIR}/jre-windows.zip

# Extract the downloaded JRE
echo "Extracting JRE..."
cd ${JRE_DIR}
unzip -q jre-windows.zip
JRE_EXTRACTED=$(ls -d jdk* 2>/dev/null || ls -d jre* 2>/dev/null)
cd ..

# Create package directory structure
echo "Creating package structure..."
mkdir -p ${PACKAGE_NAME}
cp app/build/libs/app-all.jar ${PACKAGE_NAME}/game.jar
cp README.md ${PACKAGE_NAME}/README.txt
cp LICENSE ${PACKAGE_NAME}/LICENSE

# Copy the JRE into the package
echo "Copying JRE into package..."
cp -r ${JRE_DIR}/${JRE_EXTRACTED} ${PACKAGE_NAME}/jre

# Create a Windows batch file that uses the bundled JRE
cat > ${PACKAGE_NAME}/run.bat << 'EOF'
@echo off

jre\bin\java.exe -jar app.jar

@pause
EOF

# Create the final zip archive with maximum compression
echo "Creating zip archive..."
zip -9 -r ${PACKAGE_NAME}.zip ${PACKAGE_NAME}/

# Clean up temporary directories
rm -rf ${PACKAGE_NAME}
rm -rf ${JRE_DIR}

echo ""
echo "✓ Windows package with bundled JRE created: ${PACKAGE_NAME}.zip"
echo ""