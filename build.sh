#!/bin/bash
set -e

echo "🚀 Installing Flutter..."

# Install Flutter if not already installed
if [ ! -d "$HOME/flutter" ]; then
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
fi

# Add Flutter to PATH
export PATH="$PATH:$HOME/flutter/bin"

# Accept licenses
flutter doctor --android-licenses || true

# Enable web support
flutter config --enable-web

# Get dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Build web app (--web-renderer removed - CanvasKit is default now)
echo "🏗️ Building Flutter web app..."
flutter build web --release

echo "✅ Build complete!"
