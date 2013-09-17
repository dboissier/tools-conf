" This must be first, because it changes other options as side effect
set nocompatible

" la touche leader
let mapleader = ","

" vundle : gestion des extensions vim
set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle " required! 
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

"ctrlp
Bundle 'ctrlp.vim'

" Use this option to change the mapping to invoke CtrlP
let g:ctrlp_map = '<c-p>'

" the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 2

" ignore files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/static/*,*.png,*.jpg,.svn,.Intellij*,DEV

" Set this to 1 to set searching by filename (as opposed to full path) as the default:
let g:ctrlp_by_filename = 1

map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPMRUFiles<cr>

" fond sombre
set bg=dark

" solarized
"colorscheme solarized

" coloration syntaxique
syn on

" met les buffers en arriere plan plutot que de les fermer
set hidden

" Deplace le curseur au fur et a mesure qu'on tape une recherche
set incsearch
" Met en evidence TOUS les resultats d'une recherche
set hlsearch

" Deplacer le curseur quand on ecrit un (){}[] (attention il ne s'agit pas du highlight)
set showmatch

" highlighter la ligne courante
set cursorline

" activer les numeros de lignes dans la marge :
"set number

" Afficher en permanence la barre d'etat (en plus de la barre de commande) :
set laststatus=2

" Toujours laisser des lignes visibles (ici 3) au dessus/en dessous du curseur quand on
" atteint le debut ou la fin de l'ecran :
set scrolloff=3

" Envoyer le curseur sur la ligne suivante/precedente apres usage des fleches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

" shebang automatique lors de l'ouverture nouveau d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
:autocmd BufNewFile,BufRead *.py set softtabstop=2 expandtab
:autocmd BufNewFile,BufRead buildfile set filetype=ruby
:autocmd BufNewFile,BufRead Rakefile set filetype=ruby
:autocmd BufNewFile,BufRead *.pp set filetype=ruby

set ts=2

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

