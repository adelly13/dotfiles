# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
ZSH_DISABLE_COMPFIX=true # Fixes some permissions issues
source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="vim"
alias v='vim'

# Terminal shortcuts
alias bk='cd ..'
alias la='ls -a'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/sbin:$PATH"

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'

# Rewrite Brewfile
alias holdmybeer='cd ~/.dotfiles && rm Brewfile && brew bundle dump && cd'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/adelinac/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/adelinac/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adelinac/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adelinac/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

