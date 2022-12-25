set -e

gitRepo="https://gitee.com/xdy/xvim.git"
pluginType="default"

if [ "$1" = "github" ] || [ "$2" = "github" ] ; then
    gitRepo="https://github.com/xvdy/xvim.git"
fi

if [ "$1" = "full" ] || [ "$2" = "full" ] ; then
    pluginType="full"
fi

echo $gitRepo $pluginType

if [ -d ~/.vim ]; then
  echo "backup vim"
  rm -rf ~/.vim.bk.`date +%F`
  mv ~/.vim ~/.vim.bk.`date +%F`
fi

mkdir -p ~/.vim/xvim
git clone $gitRepo  ~/.vim/xvim
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc

if [ "$pluginType" = "full" ] ; then
    vim -E -c PlugInstall -c q
else
    cp -R ~/.vim/xvim/bundles ~/.vim/
fi

