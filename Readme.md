My dotfiles
===========

My personal configuration files made, to make me more productive
(or to waster more time in dotfiles tweaking)
They are not perfect but they are doing the job. 

Content
-------

* . **vim** > vim config files and plugins 
* . **bash** > bashrc file
* . **i3wm**
    * . i3 > i3 window manager configuration file
    * . i3status > i3 status bar configuration file
* . **X11** > Xresources file

Requirements
------------

To use those configuration files(one of them or all), you will need:

* bash as your default shell
* Vi IMprove (vim)

vim configurations
------------------

Some classical configurations mainly based on the user interface, themes and fonts,
tab and indent settings, status line, and some useful mappings. 

I'm using a few useful plugins:
* . **pathogen** > the poor man's package manager (https://github.com/tpope/vim-pathogen)
* . **airline**  > lean & mean status/tabline for vim  (https://github.com/bling/vim-airline)
* . **syntastic** > a syntax checking plugin (https://github.com/scrooloose/syntastic)

And of course the molokai theme (https://github.com/tomasr/molokai)

bashrc configurations 
---------------------

The prompt is customized in order to have some visual indications concerning the system 
status like cpu usage, user, the kind of session and disk usage.

I also added some personnal useful functions and aliases to make me more lazy. 

i3 configurations
-----------------

This config is not so different than the default one, I just defined Super key as mod key,created
personnal workspaces, modified background and theme colours,  and add screen lock binding. 

i3 status configurations 
------------------------

I just added to the default configuration the disk usage of my home directory, and displayed load 
average. 

Xresources configurations 
-------------------------

Defines the color bindings for a molokai like theme the xterm. 

Thanks
------

.bashrc : thanks to Emmanuel Rouat and his precious bashrc example (http://tldp.org/LDP/abs/html/sample-bashrc.html).

.vim : thanks to Vincent Jousse (http://vincent.jousse.org) and Amir Salihefendic (http://amix.dk).

i3 and i3status: thanks to tunnelshade (https://github.com/tunnelshade/awesome-dots/tree/master/.i3). 
