# Dev Shells

Dev shells are isolated, reproducible development environments provided by Nix. Instead of installing tools globally, each shell defines its own set of dependencies that are only available inside it.

## Usage

```bash
# Enter a shell (from the flake directory)
nix develop .#<name>

# Or from anywhere
nix develop ~/nixos#<name>
```

## Available Shells

| Name   | Contents                                  |
|--------|-------------------------------------------|
| `java` | JDK 21, Maven, Gradle                     |
| `cpp`  | GCC, CMake, Make, GDB, clang-tools        |

## Using with VS Code

To open VS Code inside a dev shell so it picks up all the shell's tools and environment:

```bash
# From the flake directory
nix develop .#<name> --command code .

# Or from anywhere, opening a specific project
nix develop ~/nixos#<name> --command code /path/to/project
```

Alternatively, install the [Nix Environment Selector](https://marketplace.visualstudio.com/items?itemName=arrterian.nix-env-selector) extension. It automatically detects flake dev shells and lets you select one from the VS Code command palette (`Nix-Env: Select Environment`).

## Adding a New Shell

1. Create a file in `dev/`, e.g. `dev/python.nix`:

```nix
{ pkgs }:
{
  python = pkgs.mkShell {
    buildInputs = with pkgs; [
      python3
      python3Packages.pip
    ];
  };
}
```

1. Add it to the `shells` list in `dev/default.nix`:

```nix
shells = [
  ./java.nix
  ./cpp.nix
  ./python.nix
];
```

1. Stage the file so the flake can see it: `git add dev/`

## Quick Rust project scaffold

- Create a new project using the included helper:

```bash
# from the repository root
dev/new-rust-project.sh my-new-project
```

- This creates a `Cargo` project, copies a `flake.nix` that exposes `devShells.x86_64-linux.rust`, and adds a `.envrc` that activates that shell with `nix-direnv`.

- If you have `direnv` and `nix-direnv` installed and enabled, run:

```bash
cd my-new-project
direnv allow
```

The dev shell will then be activated automatically when you `cd` into the folder.
