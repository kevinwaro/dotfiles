My dotfiles
===========

My personal configuration files made, to make me more productive
(or to waster more time in dotfiles tweaking)
They are not perfect but they are doing the job. 

Content
-------

* **vim** > vim config files and plugins 
* **bash** > bashrc file
* **tmux** > TMUX config file
* **xfce4-terminal** > config file for the xfce4-terminal

Requirements
------------

To use those configuration files(one of them or all), you will need:

* BASH as your default shell
* Vi IMprove (vim)

vim configurations
------------------

Some classical configurations mainly based on the user interface, themes and fonts,
tab and indent settings, status line, and some useful mappings. 

I'm using a few useful plugins:
* . **pathogen** > the poor man's package manager (https://github.com/tpope/vim-pathogen)
* . **airline**  > lean & mean status/tabline for vim  (https://github.com/bling/vim-airline)
* . **syntastic** > a syntax checking plugin (https://github.com/scrooloose/syntastic)

bashrc configurations 
---------------------

The prompt is customized in order to have some visual indications concerning the system 
status like cpu usage, user, the kind of session and disk usage.

I also added some personnal useful functions and aliases to make me more lazy. 

tmux configuration
---------------------

A classical tmux setup, with some keybindings and color settings. There's also a setup statusline that displays the load average.


xfce4-terminal configurations 
---------------------

The terminal has quite simple setup, with molokai as color theme.


Thanks
------

.bashrc : thanks to Emmanuel Rouat and his precious bashrc example (http://tldp.org/LDP/abs/html/sample-bashrc.html).

.vim : thanks to Vincent Jousse (http://vincent.jousse.org) and Amir Salihefendic (http://amix.dk).
