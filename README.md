# Create React Project Script

This script automates the setup of a new React project using Bun and Vite with a Tailwind CSS configuration and Jest for testing.

## Prerequisites

- Ensure you have [Bun](https://bun.sh/) installed on your system.
- Make sure you have a terminal that supports Bash scripts.

## Usage

1. **Make the script executable** (if not already):
   ```bash
   chmod +x createReact.sh
   ```

2. **Run the script with a project name**:
   ```bash
   ./createReact.sh <project-name>
   ```

   Replace `<project-name>` with your desired project name.

## Features

- Creates a new React project with Vite.
- Installs essential dependencies including:
  - Ramda
  - Tailwind CSS
  - Material UI
  - Axios
  - Jest and Testing Library
- Initializes Tailwind CSS configuration.
- Sets up Jest for testing with a sample test file.

## After Setup

- Navigate to your project directory:
  ```bash
  cd <project-name>
  ```

- Start the development server:
  ```bash
  bun dev
  ```

- Run tests:
  ```bash
  bun jest
  ```

## License

This project is licensed under the MIT License.
