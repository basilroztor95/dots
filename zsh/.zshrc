export PATH="$HOME/.fzf/bin:$PATH"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Configure the vcs_info to show the branch name
zstyle ':vcs_info:git:*' formats ' %b'  # Add spaces around the branch name

# Define your prompt
PROMPT='%B%F{yellow}%T%f %F{blue}%~%f%F{green}${vcs_info_msg_0_}%f %#%b '  # Ensure there's space before the directory and prompt symbols
#autoload -U colors && colors

alias ls='ls --color=auto'

export EDITOR="nvim"
export VISUAL="nvim"

stty stop undef	# disable ctrl-s to stop term


HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.zhistory"


setopt APPENDHISTORY
setopt SHAREHISTORY
setopt INCAPPENDHISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

setopt autocd

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^y' edit-command-line  # Bind Ctrl + e to edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/plugins/bd/bd.zsh ] && source ~/.zsh/plugins/bd/bd.zsh
