{ ... }:

let
  git = import ./git.nix {};

  base = {
    cat = "bat";
    md = "mkdir";

    ll = "ls -l";
    la = "ls -a";

    download = "curl -O";

    pbcopy = "xsel --clipboard --input";
    pbpaste = "xsel --clipboard --output";
    k = "kubectl";
  };

in {
  user.aliases = git.aliases // base;
}