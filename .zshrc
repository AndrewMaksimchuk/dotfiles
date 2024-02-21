set -o vi

plugins=(git sudo nvm npm git-prompt zsh-autosuggestions tmux)

alias cd="cdls"
alias python=python3
alias gpv="git pull --verbose"

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="ex"
export VISUAL="vi"

function cdls() {
	cd "$1" && echo "\\033[94m-> Directory contain: \033[0m" && ls -1lh;

	if [ -e dashboard ]
	then
		./dashboard
	fi
}

nvm use node 1>/dev/null
learnwords run 1>/dev/null

. .dashboard.bash
