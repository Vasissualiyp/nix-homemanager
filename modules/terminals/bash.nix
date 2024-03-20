{ ... }:

let
  bashAliases = {
    ls = "ls --color=auto";
    grep = "grep --colour=auto";
    egrep = "egrep --colour=auto";
    fgrep = "fgrep --colour=auto";

    cdls = "cd \"$1\" && ls";
    cdf = "cd \"$(find . -type d | fzf)\"";
    endall = "$HOME/scripts/system/shutdown.sh";

    pushall = "$HOME/scripts/git/git_push_all.sh";
    pullall = "$HOME/scripts/git/git_pull_all.sh";
    addgit = "echo \"$(pwd),$(git remote get-url origin)\" >> $HOME/scripts/git/github_tracked_dirs.csv";
	citavpn ="~/scripts/VPN/citavpn.sh &";


    screenoff = "xset dpms force off";
    cald = "cal -m";

	hmupd = "$HOME/.dotfiles/home-manager-nix-update.sh";
	sysupd = "$HOME/.dotfiles/system-nix-update.sh";

    invert = "$HOME/scripts/custom_docs_editing/invert_pdf.sh";
    zd = "zathura \"$1\"";
    zl = "zathura -c $HOME/.dotfiles/zathura/zathurarc-light \"$1\"";
    zdf = "zathura $(fzf)";
    zlf = "zathura -c $HOME/.dotfiles/zathura/zathurarc-light $(fzf)";

    shgpt = "source $HOME/env/venv/bin/activate; source $HOME/.bash_profile";

    srcenv = "source ./env/bin/activate";
    devenv = "python -m venv env; source ./env/bin/activate; pip install numpy scipy matplotlib";

    cpp = "xclip -selection clipboard -o";
    stup = "$HOME/scripts/startup/startup.sh";
    wifissh = "$HOME/scripts/web/establish_ssh_over_wifi.sh \"$1\"";
    xopdf = "$HOME/scripts/custom_docs_editing/xopdf.sh";
    note = "$HOME/Software/Noterius/bin/note.sh";
    cdp="~/Software/Citerius/download_paper.sh";
    cfp="~/Software/Citerius/fuzzy_find_paper.sh";
    bslt = "$HOME/scripts/bspwm_scripts/bspwm-layouts.sh";
  };

in

{
  programs.bash = {
    enable = true;
    shellAliases = bashAliases;

    initExtra = ''
# remcon alias
remcon() {
  if [ $# -eq 0 ]; then
    $HOME/scripts/web/remoteconnect.sh
  else
    $HOME/scripts/web/remoteconnect.sh "$1"
  fi
}

# git add + commit alias
gitac() {
    git add -u
    git commit -m "$1"
}

# vi mode in bash
set -o vi

    '';

  };
}
