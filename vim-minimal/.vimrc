execute pathogen#infect()
execute pathogen#helptags()
syntax on
colorscheme koehler
set nocp
filetype plugin on
set expandtab " automatically expand any tabs to spaces
set tabstop=4 "tabs are 4 spaces
set shiftwidth=4 "indentations are 4 spaces
set nu "enable line numbers
"set paste "allows you to paste content from windows clipboard
"autocmd FileType sql let b:vimpipe_filetype="postgresql"
let b:vimpipe_command="impala-shell --quiet"
set hidden "allows you to switch between buffers without requiring saving
" enable code folding with the spacebar
nnoremap <space> za
" Enable folding
set foldmethod=indent
set foldlevel=99
" shoe me docstrings for folded code
let g:SimplyFold_docstring_preview=1

"<leader>c will send the selected text to the shell
xnoremap <leader>c <esc>:'<,'>:w !sh<CR>

let g:dbext_default_buffer_lines=15
let g:dbext_default_profile_impala = 'type=pgsql:dbname=dev:port=5439:user=sa:host=benchmarking.ciicjntcwxqv.us-east-1.redshift.amazonaws.com'
let g:dbext_default_profile = 'impala'
"airline settings... need to install custom fonts for full effect
set laststatus=2
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='laederon'
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h9
set encoding=utf-8
"syntastic settings... need to install pylint
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=0

"add jsx highlighting to js files
let g:jsx_ext_required = 0
" DBEXT {
    let g:dbext_default_display_cmd_line = 0
    let g:dbext_default_buffer_lines=15
    let g:dbext_default_profile_impala = 'type=MYSQL:MYSQL_bin=impala-shell'
    let g:dbext_default_MYSQL_extra = '--quiet'
    let g:dbext_default_profile = 'impala'
" }
" NERDTREE {
" open nerdtree automatically when vim starts up if no file specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    "CTRL + n toggles nerdtree
    map <C-n> :NERDTreeToggle<CR>
" }
" JEDI {
" show call signatures in popup
    let g:jedi#show_call_signatures=1
" }
" SQLUFORMATTER {
    vmap <leader>sqf :SQLUFormatter<cr>
" }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
""let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
