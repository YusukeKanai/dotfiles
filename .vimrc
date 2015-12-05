"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" Configrtion for Programming  Environment """""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""        NEOBUNDLE SETTING      """""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
if 0 | endif

if has('vim_starting')

  " check NeoBundle has been installed 
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle"
    call system(curl http://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh)
    call system(sh ./install.sh)
    call -rm install.sh
  endif

  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  
endif

"Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

""""
"" ????
""""
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

""""
"" VimSell
""""
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" " }}}

""""
"" Auto-completion
""""
if has('lua')
      NeoBundleLazy 'Shougo/neocomplete.vim', {
          \ 'depends' : 'Shougo/vimproc',
          \ 'autoload' : { 'insert' : 1,}
          \ }
  endif

  " neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 1 
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
  " " }}}

""""
"" Auto Spinnet
""""
NeoBundleLazy 'Shougo/neosnippet', {
  \ 'depends' : 'Shougo/neosnippet-snippets',
  \ 'autoload' : {
  \   'insert' : 1,
  \   'filetypes' : 'snippet',
  \ }}
NeoBundle 'Shougo/neosnippet-snippets'

let g:neosnippet#data_directory     = expand('~/.vim/etc/.cache/neosnippet')
let g:neosnippet#snippets_directory = [expand('~/.vim/.bundle/neosnippet-snippets/neosnippets'),expand('~/dotfiles/snippets')]
" neosnippet {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
"  }}}

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found onstartup,
" this will conveniently prompt you to install them.
NeoBundleCheck
