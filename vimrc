" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件, so是source的简写
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
" 查看当前的runtimepath :set runtimepath?
" https://medium.com/usevim/vim-101-runtimepath-83194d411b0a
exec 'set rtp+='.s:home

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------
LoadScript init/init-basic.vim
LoadScript init/init-tabsize.vim
LoadScript init/init-plugin.vim
LoadScript init/init-style.vim
LoadScript init/init-keymaps.vim
