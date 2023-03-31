if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
alias v="nvim"
alias cat="bat"
alias zt="zathura"
alias plan="v ~/Iwb/plan/plan.md"
alias md="mkdir"
alias ls="exa --icons --group-directories-first"
fish_add_path -m ~/.local/bin

source /opt/asdf-vm/asdf.fish
starship init fish | source

