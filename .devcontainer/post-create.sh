#!/bin/bash
set -e

echo "🚀 Setting up FIBO MCP development environment..."

# Install uv (fast Python package manager)
echo "📦 Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.cargo/bin:$PATH"

# Add uv to PATH permanently
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc

# Install Python dependencies
echo "📚 Installing Python dependencies..."
uv sync

# Pre-download FIBO data (but don't materialize yet to save time)
echo "📥 Pre-downloading FIBO data..."
uv run python -c "from loader import FIBODataLoader; loader = FIBODataLoader(); loader.load_graph()" || echo "⚠️  FIBO data will be downloaded on first use"

echo ""
echo "✅ Setup complete!"
echo ""
echo "📖 Quick start:"
echo "   1. Run FIBO MCP server: uv run main.py"
echo "   2. Run with materialization: uv run main.py --materialize (first run takes ~2 min)"
echo "   3. Run tests: uv run pytest"
echo "   4. Start HTTP server: uv run main.py --http --port 8000"
echo ""
echo "🔗 For Claude Code integration:"
echo "   claude mcp add --scope user fibo-mcp -- uv run --directory \"\$(pwd)\" main.py"
echo ""
