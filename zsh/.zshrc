export PATH="$HOME/.fzf/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export CLICOLOR=1

setopt APPENDHISTORY
setopt INCAPPENDHISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt CHECK_JOBS
setopt NO_BEEP
setopt SHARE_HISTORY
setopt autocd

unsetopt BGNICE
unsetopt CORRECT
unsetopt CORRECT_ALL

alias ls='ls --color=auto'

stty stop undef	# disable ctrl-s to stop term

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.zhistory"

autoload -Uz compinit
compinit -C -d ~/.zcompdump

autoload -U promptinit
promptinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U colors
colors

# git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' stagedstr     "%{$fg_bold[green]%}+%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr   "%{$fg_bold[red]%}+%{$reset_color%}"

zstyle ':vcs_info:*' formats       " (%{$fg_bold[green]%}%b%{$reset_color%})%u%c%{$reset_color%}"
zstyle ':vcs_info:*' actionformats " (%{$fg_bold[green]%}%b%{$reset_color%}|%{$fg_bold[red]%}%a%{$reset_color%})%u%c%{$reset_color%}"

precmd() {
  vcs_info
}

local prompt_with_exit_status=" %(?,%{$fg_bold[green]%}%#%{$reset_color%},%{$fg_bold[red]%}%#%{$reset_color%}) "
local colored_path="%{$fg_bold[blue]%}%~%{$reset_color%}"
local prompt_time="%{$fg_bold[yellow]%}%T%{$reset_color%}"
setopt prompt_subst
PROMPT='${prompt_time} ${colored_path}${vcs_info_msg_0_}${prompt_with_exit_status}'
#

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/plugins/bd/bd.zsh ] && source ~/.zsh/plugins/bd/bd.zsh
