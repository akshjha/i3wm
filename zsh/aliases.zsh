# Keyboard Shortcuts {{{
bindkey -s '^e' 'cd ~ && vim $(fzf)\n cd $OLDPWD\nclear\n'	
bindkey -s '^y' '. ~/.zshrc\nclear\n'
bindkey -s '^n' './tg/bin/telegram-cli -W -N\n'
function up_widget() {
      BUFFER="cd .."
      zle accept-line
}
zle -N up_widget
bindkey "^u" up_widget
bindkey '^w' forward-word
bindkey '^b' backward-word
bindkey '^d' kill-whole-line
bindkey -r "^k"
bindkey '^k' backward-kill-word
# }}}
# Package Manager {{{
function aptup() { sudo apt-get update }
function aptupgr() { sudo apt-get upgrade }
function aptcln() { sudo apt-get clean }
function aptinst() { sudo apt-get install "$1" }
function aptprg() { sudo apt-get purge "$1" }
function aptshow() { sudo apt-cache show "$1" }
function aptdep() { sudo apt-cache showpkg "$1" }
# Pacman
function pacup() { sudo pacman -Sy && sudo abs && sudo aur }
function pacls() { pacman -Qi }
function yaup() { yaourt -Sy && sudo abs && sudo aur }
function yals() { yaourt -Qi }
function yamir() { yaourt -Syy }
# }}}

function tmuxn() { tmux -2 new -s "$@" }
function tmuxk() { tmux kill-session -t "$@" }
function tmuxa() { tmux -2 a -t "$@" }

alias v='vim'
alias z='zathura'
alias ls='ls -Fh -I "*~" --color=always --group-directories'
alias ll='ls -hl -I "*~" --color=always --group-directories'
alias l='ls'
alias aa='sudo $(fc -ln -1)'
alias gotop='gotop --color=monokai'
alias tll='~/i3wm/i3/Scripts/tll.sh l'
alias tlc='~/i3wm/i3/Scripts/tll.sh c "$@"'
alias tla='~/i3wm/i3/Scripts/tll.sh a "$@"'
alias drivec="~/i3wm/zsh/scripts/drive-compile.sh"
alias ip="ip -color address"
export BM_CONFIG="$HOME/i3wm/zsh/plugins/shell-plugins/zshbookmarks/config.sh"
alias c="source $HOME/i3wm/zsh/plugins/shell-plugins/zshbookmarks/zshbookmark.sh -c $HOME/i3wm/zsh/.dirbookmarks"
