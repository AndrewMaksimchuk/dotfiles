set laststatus=2
set fillchars=eob:\ 
set secure exrc
set number

" command-line completion
set wildmenu
set wildoptions=pum

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {
	\ 'colorscheme': 'wombat'
	\ }
