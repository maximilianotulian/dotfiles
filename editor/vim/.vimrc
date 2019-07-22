set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

" vim
set number relativenumber
nnoremap t <C-]> " jump to link

augroup myvimrchooks " auto-reload configuration with :so %
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" todo-list
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

function! VimTodoListsCustomMappings()
  nnoremap <buffer> s :VimTodoListsToggleItem<CR>
  nnoremap <buffer> <Space> :VimTodoListsToggleItem<CR>
  noremap <buffer> <leader>e :silent call VimTodoListsSetItemMode()<CR>
endfunction

nnoremap <buffer> nia :VimTodoListsCreateNewItemAbove<CR>
nnoremap <buffer> nib :VimTodoListsCreateNewItemBelow<CR>

" vim-devicons
set encoding=utf8

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0
