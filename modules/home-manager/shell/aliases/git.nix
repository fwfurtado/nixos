{ ... }:

let aliases = {
     ga = "git add";

     gcl = "git clone";

     gcmsg = "git commit -m";
     gcam = "git commit --amend -C HEAD";
     gca = "git commit --amend";

     gpl = "git pull";
     gplr = "git pull --rebase";
     gps = "git push";
     gpsf = "git push -f";
     gpsup = "git push --set-upstream (git remote | into string | str trim) (git rev-parse --abbrev-ref HEAD | into string | str trim)";
     grv = "git remote -v";

     grb = "git rebase";
     grbo = "git rebase --onto";
     grba = "git rebase --abort";
     grbc = "git rebase --continue";
     grbi = "git rebase -i";

     gsq  = "git reset (git merge-base main (git rev-parse --abbrev-ref HEAD))";

     grs  = "git reset --";
     grsf = "git reset --hard";

     gr   = "git restore";
     grt = "git restore --staged";

     gs = "git status";

     gst = "git stash";
     gstf = "git stash --include-untracked";
     gstl = "git stash list";
     gstp = "git stash pop";

     gsw = "git switch";
     gsc = "git switch -c";

     gb  = "git branch";
     gt = "git tag";
  };

in {
  inherit aliases;
}