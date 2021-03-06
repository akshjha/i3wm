bindkey -e
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--prompt=">> " --color fg:-1,bg:-1,hl:230,fg+:167,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:0'
export VISUAL="vim"
export EDITOR="vim"
export TERMINAL="st"
export HIST_STAMPS="mm.dd.yyyy"
export HISTSIZE=12000
export SAVEHIST=12000
export HISTFILE="$HOME/.zsh_history"
export TERM="xterm-256color"
setopt prompt_subst
setopt promptsubst
setopt append_history
setopt extended_history
setopt sharehistory
setopt hist_reduce_blanks
setopt always_to_end
setopt complete_in_word
setopt auto_menu
