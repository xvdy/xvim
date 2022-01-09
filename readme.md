## 安装

quick start
```
curl https://raw.githubusercontent.com/xvdy/xvim/master/install.sh | sh
curl https://gitee.com/xdy/xvim/raw/master/install.sh |sh
```

```
git clone git@github.com:xvdy/xvim.git ~/.vim/
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc
vim -E -c PlugInstall -c q

or

:PlugInstall
```

## 参考
* vim 各个目录的作用
https://blog.csdn.net/u014805066/article/details/62891949

* vim python
http://vimdoc.sourceforge.net/htmldoc/if_pyth.html

* 参考配置
https://github.com/skywind3000/vim-init

* vimscript
http://www.skywind.me/blog/archives/2193

* buffer windown tab

```
A buffer is the in-memory text of a file.
A window is a viewport on a buffer.
A tab page is a collection of windows.
```

* 插件管理
https://github.com/junegunn/vim-plug

* macvim
mac自带的vim不支持python3(可以通过vim --version查看插件支持情况)，可以 `brew install macvim` 来安装macvim，然后替换命令行vim

`alias vim="/usr/local/Cellar/macvim/8.2-163_2/bin/vim"`

https://github.com/macvim-dev/macvim/wiki/FAQ
