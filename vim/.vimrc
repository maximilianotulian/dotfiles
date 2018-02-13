set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'

" The plugin declaration will be before this line
call vundle#end()
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
"set hlsearch "hihglight searches by default"
"set highlight Normal
"set ctermfg dark
"set ctermbg white

" vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'base16_colors'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#syntastic#error_symbol = 'E:'
let g:airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#syntastic#warning_symbol = 'W:'
let g:airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic for javascript
function! SyntasticESlintChecker()
    let l:npm_bin = ''
    let l:eslint = 'eslint'

    if executable('npm')
        let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
        let l:eslint = l:npm_bin . '/eslint'
    endif

    let b:syntastic_javascript_eslint_exec = l:eslint
endfunction

let g:syntastic_javascript_checkers = ["eslint"]

autocmd FileType javascript :call SyntasticESlintChecker()

" ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' "local working directory when is invoked without starting directory"

"To ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' "To ignore custom files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f' "Use a custom file listing command"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "To ignore files in gitignore"

" neerdTree config
let g:nerdtree_tabs_no_startup_for_diff = 0

" markdown syntaxt config
let g:vim_markdown_folding_disabled = 1
