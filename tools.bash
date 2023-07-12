function tools(){
	prog=$(
		echo "node $(node -v)";
		echo "npm v$(npm -v)";
		deno -V;
		python --version;
		cargo --version | cut -d ' ' -f 1,2;
		lua -v | cut -d ' ' -f 1,2;
	)
	devtools=$(
		echo $(git --version | awk '{print $1 " " $3;}')
		tmux -V
	)
	text_prog=$(echo $prog | tr '[:upper:]' '[:lower:]' | sed -e 's/$/ |/' | tr -t '\n' ' ')
	echo $text_prog
	text_devtools=$(echo $devtools | sed -e 's/$/ |/' | tr -t '\n' ' ')
	echo $text_devtools
}
