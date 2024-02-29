function tools(){
	local prog=$(
		echo "node $(node -v)" | sed 's/v//g';
		echo "npm v$(npm -v)" | sed 's/v//g';
		deno -V;
		echo "bun v$(bun --version)" | sed 's/v//g';
		python3 --version;
		cargo --version | cut -d ' ' -f 1,2;
		lua -v | cut -d ' ' -f 1,2;
		gjs --version;
		gnome-shell --version;
	)
	local devtools=$(
		echo "vscode " $(code -v | head -1)
		vi --version | head -1 | cut -d' ' -f1,5
		echo $(git --version | awk '{print $1 " " $3;}')
		tmux -V
	)
	local text_prog=$(echo $prog | tr '[:upper:]' '[:lower:]' | sed -e 's/$/ |/' | tr -t '\n' ' ' | awk '{$NF=""}1')
	local text_devtools=$(echo $devtools | tr '[:upper:]' '[:lower:]' | sed -e 's/$/ |/' | tr -t '\n' ' ' | awk '{$NF=""}1')
	echo $text_prog
	echo $text_devtools
}

function message(){
	echo "For note use command 'note'"
	echo "For read book use command 'readook rn'"	
	echo "For track money spend use command 'spending'"
	echo "For get info about github projects, use command 'control'"
	echo "For see notification with english words translation use command 'learnwords'"
}

function memory_usage(){
	df -h -x tmpfs | head -2
}

# Actions
clear

cwd=$(dirname `realpath $0`)

tools | node $cwd/.box.js > /tmp/tools.tmp
memory_usage | node $cwd/.box.js > /tmp/memory_usage.tmp
node $cwd/.columns.js "$(cat /tmp/tools.tmp)" "$(cat /tmp/memory_usage.tmp)"

echo

message | node $cwd/.box.js > /tmp/message.tmp
control in-work -e | node $cwd/.box.js > /tmp/control.tmp
calendar | node $cwd/.box.js > /tmp/calendar.tmp
node $cwd/.columns.js "$(cat /tmp/control.tmp)" "$(cat /tmp/message.tmp)" "$(cat /tmp/calendar.tmp)"
