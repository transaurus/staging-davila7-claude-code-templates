#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for davila7/claude-code-templates
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus 3.x requires Node 20+; using Node 20 (already installed)
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 20 || nvm install 20
fi
node --version
npm --version

# --- Package manager + dependencies ---
# Uses npm (package-lock.json exists)
npm install --legacy-peer-deps

# --- Build ---
npm run build

echo "[DONE] Build complete."
