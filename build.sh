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

# Load environment variables from .env file if it exists
if [ -f .env ]; then
    echo "📋 Loading environment variables from .env..."
    export $(cat .env | grep -v '^#' | xargs)
fi

# Set default values if not provided
SUPABASE_URL="${SUPABASE_URL:-https://spwsglhjwpbpoawqhsqj.supabase.co}"
SUPABASE_ANON_KEY="${SUPABASE_ANON_KEY:-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwd3NnbGhqd3BicG9hd3Foc3FqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1MTA0MjUsImV4cCI6MjA3ODA4NjQyNX0.oMxnt_s0n7KqpGaZQhRcFuWkvli3TZySyrd0o-okZK4}"

# Build web app with environment variables
echo "🏗️ Building Flutter web app..."
flutter build web --release \
  --dart-define=SUPABASE_URL="$SUPABASE_URL" \
  --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY"

echo "✅ Build complete!"
