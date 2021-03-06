call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'fatih/vim-go'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'buoto/gotests-vim',
Plug 'scrooloose/nerdtree' 
Plug 'tpope/vim-fugitive'
Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-translator'

call plug#end()

set t_Co=256                    " Set if term supports 256 colors.
colorscheme PaperColor
set background=dark
set nu  			" show line number
set spell


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
" nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" ============ CUSTOMIZE =============
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_chan_whitespace_error = 1

" Remap splits navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set splitbelow splitright

" open a terminal in vim
map <Leader>tt :vnew term://zsh<CR>

" config ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" yarn from vim to other program
vnoremap <C-c> "+y
map <C-v> "+P

" ignore swap file warning
set shortmess+=A

" reload vimrc
nnoremap <Leader>rv :source $MYVIMRC<CR>

set completeopt=longest,menuone

" Copy from https://github.com/Me1onRind/my_config/blob/master/.vimrc
"
" tagbar  ??????~/.vim/bundle/tagbar/autoload/tagbar/types/ctags.vim
nmap <F3> :TagbarToggle<CR>
let g:tagbar_expand = 1
let g:tagbar_autofocus = 1
let g:tagbar_silent = 1

" nerdtree
function! MyNerdTreeToggle()
    if g:NERDTree.ExistsForTab() || g:NERDTree.IsOpen()
        NERDTreeToggle
    else
        silent NERDTreeMirror
        if !g:NERDTree.ExistsForTab()
            NERDTreeToggle
        endif
    endif
endfunction

nmap <F2> :call MyNerdTreeToggle()<CR>

nmap <C-F> <Plug>CtrlSFPrompt
let g:ctrlsf_backend = 'ag'
" let g:ctrlsf_auto_preview = 1
let g:ctrlsf_position='bottom'
let g:ctrlsf_auto_focus = {
    \ "at" : "start",
    \ "duration_less_than": 1000
    \ }
let g:ctrlsf_search_mode = 'async'
