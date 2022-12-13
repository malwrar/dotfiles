# various locations
export PATH=$HOME/bin:$HOME/bin/anaconda/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# generic shell preferences
export EDITOR="nvim"

# oh-my-zsh vars
ZSH_THEME="bureau"
#COMPLETION_WAITING_DOTS="%F{red}waiting...%f"
DISABLE_UNTRACKED_FILES_DIRTY="true"  # don't think about untracked vcs files
HIST_STAMPS="mm/dd/yyyy"  # execution timestamp

# oh-my-zsh z-style settings
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13  # ("time" being 13 days)

# oh-my-zsh plugins
#
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker git helm kubectl microk8s minikube nmap postgres python rust vscode vi-mode)

# oh-my-zsh contingencies

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# quick configuration of my main tools
function config() {
  case "$1" in
    reload) source "$HOME/.zshrc" ;;
    zsh)    nvim "$HOME/.zshrc"; config reload ;;
    nvim)   nvim "$XDG_CONFIG_HOME/.config/zsh/init.vim" ;;
    *)      echo "usage: config (reload|zsh|vim)" ;;
  esac
}

# TODO: fancier curl for more specific questions (timing, supported methods, dirbuster, etc)
function http() {
  curl "$@"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sushi/bin/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sushi/bin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sushi/bin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sushi/bin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

