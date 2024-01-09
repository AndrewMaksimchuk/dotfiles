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

function tools(){
	prog=$(
		echo "node $(node -v)";
		echo "npm v$(npm -v)";
		deno -V;
		echo "bun v$(bun --version)";
		python --version;
		cargo --version | cut -d ' ' -f 1,2;
		lua -v | cut -d ' ' -f 1,2;
		gjs --version;
		gnome-shell --version;
	)
	devtools=$(
		echo "vscode " $(code -v | head -1)
		vi --version | head -1 | cut -d' ' -f1,5
		echo $(git --version | awk '{print $1 " " $3;}')
		tmux -V
	)
	text_prog=$(echo $prog | tr '[:upper:]' '[:lower:]' | sed -e 's/$/ |/' | tr -t '\n' ' ' | awk '{$NF=""}1')
	echo $text_prog
	text_devtools=$(echo $devtools | tr '[:upper:]' '[:lower:]' | sed -e 's/$/ |/' | tr -t '\n' ' ' | awk '{$NF=""}1')
	echo $text_devtools
}

function message(){
	echo
	echo "For note use command 'note'"
	echo "For read book use command 'readook rn'"	
	echo "For track money spend use command 'spending'"
	echo "For get info about github projects, use command 'control'"
	echo "For see notification with english words translation use command 'learnwords'"
}

function memory_usage(){
	echo
	df -h -x tmpfs | head -2
}

# Dashboard
nvm use node 1>/dev/null
tools
memory_usage
message
echo
control in-work -e
learnwords run 1>/dev/null
echo

set -o vi
