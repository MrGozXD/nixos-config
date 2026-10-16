{
  programs.git = {
    enable = true;
    userName = "Yannis";
    userEmail = "yannisp70@gmail.com";
    initDefaultBranch = "main";
    credential.helper = "!gh auth git-credential";
    url."https://github.com/".insteadOf = "git@github.com:";
  };
}
