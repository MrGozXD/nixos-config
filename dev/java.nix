{ pkgs }:
{
  java = pkgs.mkShell {
    buildInputs = with pkgs; [
      jdk21
      maven
      gradle
    ];
    shellHook = ''
      echo "Java $(java --version | head -1)"
    '';
  };
}
