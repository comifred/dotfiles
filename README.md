Introduce
=====
  
- vimrc  
Vim profile file. Copy or symlink it to .vimrc under your $HOME.  
Prerequisite:  
vim-7.4+    cscope    ctags    python-2.7.x    make    git    the_silver_searcher(or silversearcher-ag)  
Optional:  
ccglue    tmux    golang  
  
How to use it?
1. mkdir -p ~/.vim/bundle
2. git clone https://www.github.com/VundleVim/Vundle.vim
3. If the version of your vim is less than 8.0, please comment vim-go plugin in vimrc file. Then execute "cp vimrc ~/.vimrc"
4. Start vim, using 'BundleList' command in vim to make sure the vundle plugin works. 
5. Then execute 'BundleInstall' to install all of the plugins.  

After that, you may need to run the following commands to install some plugins manually:
1. 'install.py' script in directory $HOME/.vim/bundle/YouCompleteMe/.
2. 'cp ~/.vim/bundle/CCTree/ftplugin/cctree.vim ~/.vim/plugin/'.
   
- bashrc  
Bash profile file. Copy or symlink it to .bashrc under to your $HOME  
  
- .gitconfig  
Git configuration file, some useful settings and aliases.  
  
- .gitignore  
Unwanted traced files by git.  
  
- tmux.conf  
tmux configure file. Copy or symlink it to .tmux.conf under to your $HOME  
  
