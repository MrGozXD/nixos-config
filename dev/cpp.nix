{ pkgs }:
{
  cpp = pkgs.mkShell {
    buildInputs = with pkgs; [
      gcc
      cmake
      gnumake
      gdb
      clang-tools
    ];
    shellHook = ''
      echo "C++ $(g++ --version | head -1)"
    '';
  };
}
