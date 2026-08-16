#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "${1-}" ]; then
  echo "Usage: $0 <project-name> [dest-dir]"
  exit 2
fi

name=$1
dest="${2:-$PWD}/${name}"

if [ -e "$dest" ]; then
  echo "Destination '$dest' already exists. Aborting." >&2
  exit 1
fi

mkdir -p "$dest"
cd "$dest"

# Initialize git repository
git init

# Initialize a cargo project if cargo is available, otherwise create minimal layout
if command -v cargo >/dev/null 2>&1; then
  cargo init --vcs none --name "$name" .
else
  mkdir -p src
  cat > src/main.rs <<'EOF'
fn main() {
    println!("Hello, world!");
}
EOF
  cat > Cargo.toml <<EOF
[package]
name = "$name"
version = "0.1.0"
edition = "2021"

[dependencies]
EOF
fi

# Create a basic README
cat > README.md <<EOF
# $name

A Rust project.

## Build

\`\`\`bash
cargo build
\`\`\`

## Run

\`\`\`bash
cargo run
\`\`\`
EOF

# Copy the flake and .envrc template from the repo
cp "$script_dir/templates/rust/flake.nix" "$dest/flake.nix"
cp "$script_dir/templates/rust/.envrc" "$dest/.envrc"

echo "Created Rust project at $dest"
echo "Run 'direnv allow' inside the project to activate the dev shell (requires direnv + nix-direnv)."
