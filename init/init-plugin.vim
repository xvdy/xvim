"======================================================================
"
" init-plugins.vim -.
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
   let g:bundle_group = ['nerdtree']
endif

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
   let path = expand(s:home . '/' . a:path )
   return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
   Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
   Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
   let g:NERDTreeMinimalUI = 1
   let g:NERDTreeDirArrows = 1
   let g:NERDTreeHijackNetrw = 0
   noremap <space>nn :NERDTree<cr>
   noremap <space>no :NERDTreeFocus<cr>
   noremap <space>nm :NERDTreeMirror<cr>
   noremap <space>nt :NERDTreeToggle<cr>
endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
