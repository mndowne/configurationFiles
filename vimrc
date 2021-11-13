""""""""""""""""""""""""""""""""""""""""
"""           VIM PLUGINS          
""""""""""""""""""""""""""""""""""""""""

"this is loading my plug ins
"run   pluginvim   to see plugins
execute pathogen#infect()

"this configures my jsx syntex to .js files
let g:jsx_ext_required = 0

"change vim colors
"//highlight Normal ctermfg=white ctermbg=darkcyan

"add .html syntex highlighting to .ejs files
au BufNewFile,BufRead *.ejs set filetype=html


""""""""""""""""""""""""""""""""""""""""
"""           VIM PLUGINS          
""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"""    VIM VARIABLES AND REMAPS
"""""""""""""""""""""""""""""""""""""""

set number
set relativenumber



"to turn off line wrap
"//set nowrap

"these are tab hot keys. switched these to buffers
"    nnoremap tn :tabnew<Space>
"    nnoremap tk :tabnext<CR>
"    nnoremap tj :tabprev<CR>
"    nnoremap th :tabfirst<CR>
"    nnoremap tl :tablast<CR>

"buffer hot keys
nnoremap tn :e<Space>
nnoremap tk :bnext<CR>
nnoremap tj :bprev<CR>
nnoremap th :b1<CR>
"nnoremap tl :tablast<CR>

"switching between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set autoindent

"this makes tab key X spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Search variables.
"""""""""""""""'""
"whlie searching through file highlight matching characters
set incsearch
"Show matching words during a search
set showmatch
"highlight my search results
set hlsearch
"Use Space + n to removing highlighting from search
nnoremap <Space>n :noh<Return>

"set the commands to save in history to 100
set history=100

"Use Space + t to open and close NERDTree
nnoremap <Space>t :NERDTreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""
"""    VIM VARIABLES AND REMAPS
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"""    VIM SNIPPETS
"""""""""""""""""""""""""""""""""""""""

nnoremap <Space>html :-1read ~/.vim/skeletonCode/skeleton.html<CR>4jf>a
nnoremap <Space>ep :-1read ~/.vim/skeletonCode/skeletonExpress.js<CR>

"""""""""""""""""""""""""""""""""""""""
"""    VIM SNIPPETS
"""""""""""""""""""""""""""""""""""""""
