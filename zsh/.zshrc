# need download https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
. ~/.git-prompt.sh

precmd () { __git_ps1 "%F{8}[%f%1~" " %# " " %s" }

export GIT_PS1_SHOWCONFLICTSTATE="yes"
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=true
#

export EDITOR="nvim"
export VISUAL="nvim"

alias ls='ls --color=auto'

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U compinit && compinit

zstyle ':completion:*' menu select=0
zstyle ':completion:*' verbose yes

export PATH="$HOME/.fzf/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kubernetes kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000
