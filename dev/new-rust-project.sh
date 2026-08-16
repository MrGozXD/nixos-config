#!/usr/bin/env bash
set -euo pipefail

# Resolve the real script location, so it keeps working when invoked via a symlink
script_path="${BASH_SOURCE[0]}"
while [ -L "$script_path" ]; do
  script_dir_real="$(cd -P "$(dirname "$script_path")" && pwd)"
  script_path="$(readlink "$script_path")"
  case "$script_path" in
    /*) ;;
    *) script_path="$script_dir_real/$script_path" ;;
  esac
done
script_dir="$(cd -P "$(dirname "$script_path")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

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
if [ -f "$repo_root/dev/templates/rust/flake.nix" ] && [ -f "$repo_root/dev/templates/rust/.envrc" ]; then
  cp "$repo_root/dev/templates/rust/flake.nix" "$dest/flake.nix"
  cp "$repo_root/dev/templates/rust/.envrc" "$dest/.envrc"
elif [ -f "$script_dir/templates/rust/flake.nix" ] && [ -f "$script_dir/templates/rust/.envrc" ]; then
  cp "$script_dir/templates/rust/flake.nix" "$dest/flake.nix"
  cp "$script_dir/templates/rust/.envrc" "$dest/.envrc"
else
  echo "Missing template files in repo. Expected under dev/templates/rust/" >&2
  exit 1
fi

# Create a sensible .gitignore for Rust projects and common editors/tools
cat > .gitignore <<'EOF'
# Rust
/target/
**/*.rs.bk

# Environment
.env
.env.local
.direnv/

# Editors/IDE
.vscode/
.idea/
.DS_Store

# Node/Build
node_modules/
dist/

# Logs
*.log
EOF

git add flake.nix .envrc .gitignore

if command -v direnv >/dev/null 2>&1; then
  direnv allow
else
  echo "direnv is not installed; run 'direnv allow' once it is available."
fi

echo "Created Rust project at $dest"
echo "Project is ready. You are in $dest."
