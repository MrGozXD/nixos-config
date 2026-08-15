{ lib, colors, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 350;
      always_parse_args = true;
      show_all = false;
      print_command = true;
      insensitive = true;
      allow-images = true;
      allow_images = true;
      image_size = 24;
      prompt = ">>";
      layer = "overlay";
      columns = 1;
    };
    style = lib.mkForce ''
      * {
        font-family: "JetBrains Mono", monospace;
        font-size: 13px;
        font-weight: 400;
      }

      window {
        background-color: #${colors.bg};
        border: 1px solid #${colors.fg-muted};
        border-radius: 0px;
      }

      #input {
        background-color: #${colors.bg};
        color: #${colors.fg-bright};
        border: none;
        border-bottom: 1px solid #${colors.fg-muted};
        border-radius: 0;
        padding: 8px 12px;
        margin: 0;
      }

      #input:focus {
        border-bottom: 1px solid #${colors.accent};
      }

      #outer-box {
        margin: 0;
        padding: 0;
      }

      #scroll {
        margin: 0;
      }

      #entry {
        padding: 4px 12px;
        color: #${colors.fg};
        border-radius: 0;
        border: none;
      }

      #entry:selected {
        background-color: transparent;
        color: #${colors.accent};
      }

      #entry:selected #text {
        color: #${colors.accent};
      }

      #entry:selected::before {
        content: ">> ";
      }

      #img {
        margin-right: 8px;
      }

      #text {
        margin: 0;
      }
    '';
  };
}
