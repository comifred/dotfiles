Introduce
=====
  
- vimrc  
Vim profile file. Copy or symlink it to .vimrc under your $HOME.  
Prerequisite:  
vim-7.4+    cscope    ctags    python-2.7.x    make    the_silver_searcher(or silversearcher-ag)  
Optional:  
ccglue    tmux  
  
Using 'BundleList' command in vim to make sure it works.  
And then execute 'BundleInstall' to install all of the plugins.  
After that, you need to run the following commands to install some plugins manually:
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
  
