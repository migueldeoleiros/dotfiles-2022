# **DOTFILES**

![Desktop
Screenshot](https://github.com/migueldeoleiros/dotfiles/blob/master/.screenshots/dwm_2022-07-15_12-35-16.png?raw=true)

This repository was made for me to more easily manage my dotfiles and
configuration for my linux system, but you are more than welcome to take
them as a reference or use them yourself. This are not all the dotfiles
on my machine, only the ones that I personaly modified.

# My Program Configs

## My configs for different shells 
(aliases are separeted on [.alias](https://github.com/migueldeoleiros/dotfiles/blob/master/.alias))
* [zsh shell](https://github.com/migueldeoleiros/dotfiles/blob/master/.zshrc) (My shell of choice )
* [bash shell](https://github.com/migueldeoleiros/dotfiles/blob/master/.bashrc)
        
## Keyboard setup
For my keyboard I'm using both sxhkd and kmonad, althow I'm planing on moving all to kmonad
* [sxhkd](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/sxhkd) (for keyboard shortcuts)
* [kmonad](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/kmonad) (for keyboard layout and spanish accents )
* [Xmodmap](https://github.com/migueldeoleiros/dotfiles/blob/master/.Xmodmap) (I used this for hjkl as arrow keys, but I now archieve that with kmonad)
        
## Terminal emulator
I'm mainly using my build of **st** with some patches, but I also have a kitty and alacritty config that look pretty similar
* [st](https://github.com/migueldeoleiros/st) (my build of st) 
* [kitty](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/kitty) 
* [alacritty](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/alacritty)
        
## Browser
I use both qutebrowser and firefox for my browser, using firefox userChrome to make them look similar and less bloated
* [qutebrowser](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/qutebrowser)
* [firefox userChrome](https://github.com/migueldeoleiros/dotfiles/tree/master/.mozilla/firefox/npjby8q7.default-release/chrome) 

## Text editor
I'm currently using emacs because of the better IDE features like code completion, but both of this configs are usable and have a lot of the same features
* [neovim](https://github.com/migueldeoleiros/dotfiles/blob/master/.config/nvim) 
* [emacs](https://github.com/migueldeoleiros/dotfiles/tree/master/.emacs.d) (check out [System Crafter](https://systemcrafters.net/))
        
## Window Manager 
I'm currently using my build of **dwm**
* [dwm](https://github.com/migueldeoleiros/dwm) (My build of dwm)
* [i3 window manager](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/i3) (Simple user frieldly manual window manager)
* [stumpwm](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/stumpwm) Window manager written and configured in Common Lisp (config based on [Gavin's work](https://www.youtube.com/watch?v=TdQdBQu3fFM&t=816s))
        
## Other apps
* [tmux](https://github.com/migueldeoleiros/dotfiles/blob/master/.config/tmux) (terminal multiplexer configured with vim-like bindings for my sanity)
* [ranger file-manager](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/ranger) (Best terminal file manager out there)
* [rofi](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/rofi) (I use for both my scripts and as an app launcher)
* [dunst](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/dunst) (Notification daemon without bloat)
* [picom](https://github.com/migueldeoleiros/dotfiles/tree/master/.config/picom.conf) (Currently using [jonaburg's](https://github.com/jonaburg/picom) fork of picom for round corners, animations and blur)
