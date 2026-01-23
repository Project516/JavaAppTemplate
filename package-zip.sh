#!/bin/sh

# Clean up any previous builds
rm -rf package-zip
rm -f JavaAppTemplate.zip

# Build the application
./gradlew build

# Create distribution directory structure
mkdir package-zip

# Copy the game JAR and necessary files
cp -r app/build/libs/app-all.jar package-zip/app.jar
cp -r scripts/run.bat package-zip/run.bat
cp -r scripts/run.sh package-zip/run.sh
cp -r README.md package-zip/README.txt
cp -r LICENSE package-zip/LICENSE

# Create the ZIP archive with maximum compression
zip -9 -r JavaAppTemplate.zip package-zip/

# Clean up temporary directory
rm -rf package-zip