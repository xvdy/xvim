if [ ! -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bk.`date +%F`
fi

mkdir -p ~/.vim/xvim
git clone https://github.com/xvdy/xvim.git ~/.vim/xvim
echo 'source ~/.vim/xvim/vimrc' > ~/.vimrc
cp -R ~/.vim/xvim/bundles ~/.vim/
