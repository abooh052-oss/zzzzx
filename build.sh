#!/bin/bash

# Build script for Render deployment

echo "Starting build process..."

# Install dependencies
echo "Installing dependencies..."
npm install

# Check if client directory exists
echo "Checking project structure..."
ls -la
ls -la client/

# Ensure we're in the correct directory for the build
echo "Current working directory: $(pwd)"
echo "Contents of client directory:"
ls -la client/

# Build the client (frontend) - run vite build separately
echo "Building client with vite..."
npx vite build

# Build the server
echo "Building server..."
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist

# Verify build output
echo "Verifying build output..."
ls -la dist/
if [ -d "dist/public" ]; then
    echo "Frontend build successful:"
    ls -la dist/public/
else
    echo "ERROR: Frontend build failed - dist/public directory not found"
    exit 1
fi

# Push database schema
echo "Pushing database schema..."
npm run db:push --force

echo "Build completed successfully!"