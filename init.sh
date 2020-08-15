if [ ! -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bk.`date +%F`
fi

git clone git@github.com:xvdy/xvim.git ~/.vim/
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc
mv ~/.vim/xvim/bundles ~/.vim/
