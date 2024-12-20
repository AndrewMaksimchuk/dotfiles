set -o vi

plugins=(git sudo nvm npm git-prompt zsh-autosuggestions tmux)

function t2
{
	tmux new-session -s "mySession" -d
	tmux split-window -h
	tmux -2 attach-session -d 
}

function t3
{
	tmux new-session -s "mySession" -d
	tmux split-window -h
	tmux split-window -v
	tmux -2 attach-session -d 
}

function cdls() {
	cd "$1" && echo "\\033[94m-> Directory contain: \033[0m" && ls -1lh;

	if [ -e dashboard ]
	then
		./dashboard
	fi
}

alias cd="cdls"
alias python=python3
alias gpv="git pull --verbose"
alias log="git log --oneline --graph --decorate --all"
alias t="tmux"
alias todo="nvim ~/.todo.md"
alias v=nvim
alias j=jobs
alias f=fg
alias web="webstorm 2>/dev/null &"
alias ls=lsd

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="ex"
export VISUAL="vi"

nvm use node 1>/dev/null
learnwords run 1>/dev/null

. .dashboard.bash

source ~/.dashboard.bash
