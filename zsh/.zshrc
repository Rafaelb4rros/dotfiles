# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# END

export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# DEFAULTS
export LANG=en_US.UTF-8
export EDITOR="nvim"
export ARCHFLAGS="-arch x86-64"
# END

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/iwbtbpotw/.zshrc'

autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -e
# End

ZSH="$HOME/.config/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    archlinux
    zsh-navigation-tools
    golang
    common-aliases
    colored-man-pages
    aliases
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)



ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/defaults.sh
source $HOME/.config/zsh/aliases.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
