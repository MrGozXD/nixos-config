{
  programs.git = {
    enable = true;
    settings.user.name = "Yannis";
    settings.user.email = "yannisp70@gmail.com";
    settings.init.defaultBranch = "main";
    settings.credential.helper = "!gh auth git-credential";
    settings.url."https://github.com/".insteadOf = "git@github.com:";
  };
}
