
"turn filetype plugins on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""
"""           VIM PLUGINS          
""""""""""""""""""""""""""""""""""""""""
" Emmet Shortcuts
let g:user_emmet_mode='n'  "only enable normal mode functions.
let g:user_emmet_leader_key=','


"this is loading my plug ins
"run   pluginvim   to see plugins
execute pathogen#infect()
execute pathogen#helptags()

"NEARDTRee neardtree NEARDTREE
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"ONEDARK onedark Onedark
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
      endif
"endif


syntax on
colorscheme onedark

"this configures my jsx syntex to .js files
let g:jsx_ext_required = 0

"add .html syntex highlighting to .ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" vim Airline
" vim Airline Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" vim airline powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" vim airline file format display
let g:airline#extensions#tabline#formatter = 'unique_tail'

" vim airline color theme
let g:airline_theme='angr'

" add to get vim airline theme to work in tmux
"set t_Co=256


" FZF commands
"--------------------------------------------------------------------------
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"map <C-f> :Files<CR>
"map <leader>b :Buffers<CR>
"nnoremap <leader>g :Rg<CR>
"nnoremap <leader>t :Tags<CR>
"nnoremap <leader>m :Marks<CR>

"EXCLUDE FILES FROM FZF search with Vim-rooter
"let g:rooter_patterns = ['!.git']
"let g:rooter_autocmd_patterns = '.git/*'


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file $HOME/.config/.ignore"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case --ignore-file $HOME/.config/.ignore '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
let initial_command = printf(command_fmt, shellescape(a:query))
let reload_command = printf(command_fmt, '{q}')
let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
\ call fzf#vim#grep(
\   'git grep --line-number '.shellescape(<q-args>), 0,
\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"--------------------------------------------------------------------------
" FZF commands

"ALE ale
" Disable Ale from checking for errors all the tim
" I only want Ale to check when the file is saved or opened
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0

""""""""""""""""""""""""""""""""""""""""
"""           VIM PLUGINS          
""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"""    VIM VARIABLES AND REMAPS
"""""""""""""""""""""""""""""""""""""""

set omnifunc=syntaxcomplete#Complete
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

"to turn off line wrap
set nowrap

"set the commands to save in history to 1000
set history=1000

"this allows for hidden buffers. You can edit multiple buffers without saving them
set hidden

set number
set relativenumber

"Change the scroll speed to 6 lines at a time
nnoremap <C-U> 6<C-Y>
nnoremap <C-D> 6<C-E>

nnoremap gj }
nnoremap gk {

"AutoComplete set to Tab
"inoremap <Tab> <C-P>

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
"close a buffer without closing the split
nnoremap ,d :b#<bar>bd#<CR>

"switching between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"quick macro when in visual mode to all selected lines
nnoremap <Space>m :norm 
xnoremap <Space>m :norm 
xnoremap <Space>sr :s//g<Left><Left>
xnoremap <Space>sc :s//gc<Left><Left><Left>


:command Vimrc e ~/.vimrc

"Use Space + t to open and close NERDTree
nnoremap <Space>t :NERDTreeToggle<cr>

"vim easymotion hot key for
map <Space>w <Plug>(easymotion-bd-f2)
nmap <Space>w <Plug>(easymotion-overwin-f2)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)

"Use Space + g to open and close git-fugitive
nnoremap <Space><Space>g :G<cr>
nnoremap <Space>gb :Gbrowse<cr>

"Search and replace, search and check
nnoremap <Space>sr :%s//g<Left><Left>
nnoremap <Space>sc :%s//gc<Left><Left><Left>

"FZF remap
"find file names
nnoremap <Space>ff :Files<CR>
"find a string in a file or in a file name
nnoremap <Space>fl :Rg<CR>
nnoremap <Space>fs :BLines<CR>
"find a string in the current file
nnoremap <Space>fj :Lines<CR>
"find a string in your command history
nnoremap <Space>fh :History:<CR>


"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""    VIM VARIABLES AND REMAPS
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"""    VIM SNIPPETS
"""""""""""""""""""""""""""""""""""""""
"create a new skeleton
nnoremap <Space>Nsk :e ~/.vim/skeletonCode/

nnoremap <Space>html :-1read ~/.vim/skeletonCode/skeleton.html<CR>/JJJ<CR>cw
nnoremap <Space>Ehtml :e ~/.vim/skeletonCode/skeleton.html<CR>

nnoremap <Space>ep :-1read ~/.vim/skeletonCode/skeletonExpress.js<CR>
nnoremap <Space>Eep :e ~/.vim/skeletonCode/skeletonExpress.js<CR>

nnoremap <Space>ll :-1read ~/.vim/skeletonCode/skeletonArrowFunction.js<CR>/JJJJ<CR>cw
nnoremap <Space>Ell :e ~/.vim/skeletonCode/skeletonArrowFunction.js<CR>

"""    VIM SNIPPETS REACT
nnoremap <Space>rfc :-1read ~/.vim/skeletonCode/react/statelessFunctionComponent.js<CR>:%s/JJJ/<c-r>=expand('%:t:r')<CR><CR>
nnoremap <Space>Erfc :e ~/.vim/skeletonCode/react/statelessFunctionComponent.js<CR>

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""    VIM SNIPPETS
"""""""""""""""""""""""""""""""""""""""

