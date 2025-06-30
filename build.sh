#!/bin/bash

set -e  # Stop on first error

echo "🧹 Cleaning old embedded quotes..."
rm -f Sources/EmbeddedQuotes.swift

echo "🔁 Generating EmbeddedQuotes.swift..."
swift BuildScripts/ConvertJSONToSwift.swift Quotes/quotes.json Sources/EmbeddedQuotes.swift

echo "🛠 Building project..."
xcodebuild -scheme quoter -configuration Release

# Optional: copy the binary globally (edit as needed)
echo "📦 Installing to /usr/local/bin/quoter"
cp "$(xcodebuild -scheme quoter -configuration Release -showBuildSettings | grep -m 1 BUILD_DIR | cut -d '=' -f2 | xargs)/Release/quoter" /usr/local/bin/quoter
chmod +x /usr/local/bin/quoter

echo "✅ Build complete. Run it with: quoter"