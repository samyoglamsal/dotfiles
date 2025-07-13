# Interactive shell env vars
export EDITOR=nvim

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS='--tmux center --preview "bat --color=always {}"'
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMAMND="fd --type d $FD_OPTIONS"
source <(fzf --zsh)

HISTFILE=$XDG_STATE_HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt autocd beep extendedglob nomatch
bindkey -v
autoload -U colors && colors
autoload -U compinit && compinit

git_ps1 () {
    local branch_name
    local is_modified_status=""

    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        is_modified_status="*"
    fi

    branch_name=$(git branch --no-color 2>/dev/null | sed -E -n 's/^\* (.*)/\1/p')
    if [[ -n "${branch_name}" ]]; then
        if [[ "${is_modified_status}" == "*" ]]; then
            echo " %F{red}(${branch_name}${is_modified_status})%f"
        else
            echo " %F{green}(${branch_name}${is_modified_status})%f"
        fi
    else
        echo ""
    fi
}

# PROMPT="%F{red}[%f%F{255}%*%f%F{red}]%f-%F{red}[%f%F{214}%n%f%F{yellow}@%f%F{green}%m%f%F{red}]%f-%F{red}[%f%F{blue}%~%f%F{red}]%f%F{green}$%f "
setopt prompt_subst
PROMPT='%F{red}[%f%F{255}%*%f%F{red}]%f-%F{red}[%f%F{blue}%~%f%F{red}]%f$(git_ps1) %F{magenta}$%f '

# ls colors on autocomplete
eval "$(dircolors)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Caseless autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

if [[ -f "$XDG_CONFIG_HOME/zsh/.aliases" ]]; then
    source "$XDG_CONFIG_HOME/zsh/.aliases"
fi

