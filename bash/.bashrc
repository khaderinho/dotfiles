[[ $- != *i* ]] && return

# Git branch
git_branch() {
  branch=$(git branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " $branch"
  fi
}

# Prompt
PS1='\[\e[92m\]\u \H \[\e[96;1m\]\w\[\e[0m\]\[\e[91m\]$(git_branch)\[\e[0m\] \[\e[95;1m\]>>\[\e[0m\] '

# Vim
set -o vi

# Aliases
alias ls="ls --color"
alias ll="ls -ll"
alias la="ls -la"

alias u="sudo pacman -Syu"
alias q="sudo pacman -Qs"
alias i="sudo pacman -S"
alias r="sudo pacman -Rns"
