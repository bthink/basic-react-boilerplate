#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Create a new project using Bun and Vite with React template
echo "Creating a new React project with Vite..."
bun create vite "$PROJECT_NAME" --template react

# Navigate to the project directory
cd "$PROJECT_NAME" || exit

# Install dependencies
echo "Installing dependencies..."
bun add ramda tailwindcss @mui/material axios @mui/icons-material jest @testing-library/react @testing-library/jest-dom babel-jest

# Initialize Tailwind CSS with a configuration file
echo "Initializing Tailwind CSS..."
npx tailwindcss init

# Add Tailwind CSS to PostCSS configuration
echo "Adding Tailwind CSS configuration..."
cat <<EOL >> ./src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Configure Jest
echo "Setting up Jest configuration..."
cat <<EOL > jest.config.js
module.exports = {
  testEnvironment: "jsdom",
  setupFilesAfterEnv: ["<rootDir>/setupTests.js"],
  moduleNameMapper: {
    "\\.(css|less|sass|scss)$": "identity-obj-proxy"
  },
};
EOL

# Add Jest setup file
echo "Creating Jest setup file..."
cat <<EOL > setupTests.js
import '@testing-library/jest-dom';
EOL

# Add example test file
mkdir -p src/__tests__
cat <<EOL > src/__tests__/App.test.js
import { render, screen } from '@testing-library/react';
import App from '../App';

test('renders the app component', () => {
  render(<App />);
  const linkElement = screen.getByText(/Vite/i);
  expect(linkElement).toBeInTheDocument();
});
EOL

echo "Configuration complete!"

# Instructions to the user
echo "Project $PROJECT_NAME is ready!"
echo "Navigate to the project directory with 'cd $PROJECT_NAME'"
echo "Start the development server with 'bun dev'"
echo "Run tests with 'bun jest'"
