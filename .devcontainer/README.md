# GitHub Codespaces Setup for FIBO MCP

This repository is configured for GitHub Codespaces with automatic setup.

## Quick Start

1. **Open in Codespace**: Click the "Code" button → "Codespaces" → "Create codespace on main"
2. **Wait for setup**: The devcontainer will automatically install `uv` and dependencies (~2-3 minutes)
3. **Start using**: The environment is ready!

## What's Included

The devcontainer automatically sets up:
- ✅ Python 3.11
- ✅ `uv` package manager
- ✅ All project dependencies
- ✅ VS Code extensions (Python, Ruff, Pylance)
- ✅ Git and common utilities
- ✅ Port forwarding for HTTP server (8000)

## Usage

### Run FIBO MCP Server

```bash
# Basic mode
uv run main.py

# With OWL-RL materialization (recommended, first run ~2 min)
uv run main.py --materialize

# HTTP server mode
uv run main.py --http --port 8000
```

### Run Tests

```bash
uv run pytest
```

### Add to Claude Code

```bash
claude mcp add --scope user fibo-mcp -- uv run --directory "$(pwd)" main.py --materialize
# Restart Claude Code to load the MCP
```

## Configuration Files

- `.devcontainer/devcontainer.json` - Codespace configuration
- `.devcontainer/post-create.sh` - Automatic setup script
- `pyproject.toml` - Project dependencies

## Troubleshooting

### If setup fails
Manually run the setup:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.cargo/env
uv sync
```

### Re-download FIBO data
```bash
uv run main.py --force-download
```

### Clear materialization cache
```bash
rm -f data/fibo_materialized.ttl
```

## Learn More

See the main [README.md](../README.md) for detailed usage examples and documentation.
