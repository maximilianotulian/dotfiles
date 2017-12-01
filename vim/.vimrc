set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

" Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'morhetz/gruvbox'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'raimondi/delimitmate'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" The plugin declaration will be before this line
filetype plugin indent on

" NerdTree config 'add shortkey to toggle'
map <C-n> :NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set laststatus=2 "always show statusline
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with '>', use 4 spaces
set expandtab "on pressing tab, insert 4 spaces
set autoindent "copy the indentation from the previous line
set t_Co=256 "use 256 colours
set number "insert line's number
set incsearch "highlight while searching with / or ?
set hlsearch "hihglight searches by default"
"set highlight Normal
"set ctermfg dark
"set ctermbg white

" vim airline config
let g:airline#extensions#syntastic#enabled = 1

" vim-jsx config
let g:jsx_ext_required = 0

" gruvbox config
let g:gruvbox_italic=0
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox
set background=light

" vim-javascript config
let g:javascript_enable_domhtmlcss = 1

" syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' "local working directory when is invoked without starting directory"
"To ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' "To ignore custom files and directories
let g:ctrlp_user_command = 'find %s -type f' "Use a custom file listing command" 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "To ignore files in gitignore"

" End config

" USEFUL INFO
" fugitive 
" :Gsplit, :Gvsplit, :Gtabedit....
" :Gstatus
" :Gblame brings up an interactive vertical split with git blame

" surround
" V + S + initial html tag
" yssb wrap in ()
" yss x where x is a (,{, [, wrap content in x
" ds" to remove the delimeters entirely
" cs"' to change " for '
