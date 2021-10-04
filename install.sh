if [ ! -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bk.`date +%F`
fi

mkdir -p ~/.vim/xvim
git clone https://github.com/xvdy/xvim.git ~/.vim/xvim
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc

if [ $1 == "full" ]
    vim -E -c PlugInstall -c q
else
    cp -R ~/.vim/xvim/bundles ~/.vim/
fi
