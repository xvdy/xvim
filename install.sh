gitRepo="https://gitee.com/xdy/xvim.git"
pluginType="default"

if test $1 = "github" -o $2 = "github" ; then
    gitRepo="https://github.com/xvdy/xvim.git"
fi
if test $1 = "full" -o $2 = "full" ; then
    pluginType="full"
fi

echo $gitRepo $pluginType

if [ ! -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bk.`date +%F`
fi

mkdir -p ~/.vim/xvim
git clone $gitRepo  ~/.vim/xvim
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc

if [ $pluginType == "full" ]
    vim -E -c PlugInstall -c q
else
    cp -R ~/.vim/xvim/bundles ~/.vim/
fi
