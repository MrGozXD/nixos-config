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
| `rust` | rustc, cargo, rustfmt, clippy, rust-analyzer |

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

2. Add it to the `shells` list in `dev/default.nix`:

```nix
shells = [
  ./java.nix
  ./cpp.nix
  ./rust.nix
  ./python.nix
];
```

3. Stage the file so the flake can see it: `git add dev/`
