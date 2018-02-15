#!/usr/bin/env bash

set -euo pipefail

# You want to know what plugins I use huh?  Check out: 
# https://www.robertmelton.com/2014/05/27/vim-and-me/
rm -rf bundle
mkdir -p bundle

# Themes
#git clone https://github.com/robertmeta/nofrils bundle/nofrils 
#git clone https://github.com/tomasr/molokai bundle/molokai 
#git clone https://github.com/endel/vim-github-colorscheme bundle/githubtheme 

# Plugins
git clone https://github.com/ajh17/VimCompletesMe bundle/vcm 
git clone https://github.com/benmills/vimux bundle/vimux 
git clone https://github.com/fatih/vim-go bundle/vim-go 
#git clone https://github.com/garbas/vim-snipmate bundle/snipmate 
#git clone https://github.com/honza/vim-snippets bundle/snippets 
git clone https://github.com/justinmk/vim-dirvish bundle/dirvish 
git clone https://github.com/justinmk/vim-sneak bundle/sneak 
git clone https://github.com/ludovicchabant/vim-gutentags bundle/gutentags 
git clone https://github.com/MarcWeber/vim-addon-mw-utils bundle/mwutils 
git clone https://github.com/mbbill/undotree bundle/undotree 
git clone https://github.com/romainl/vim-qf bundle/qf 
git clone https://github.com/romainl/vim-qlist bundle/qlist 
#git clone https://github.com/romainl/vim-tinyMRU bundle/mru 
git clone https://github.com/sheerun/vim-polyglot bundle/polygot 
#git clone https://github.com/tommcdo/vim-lion bundle/lion 
git clone https://github.com/tomtom/tlib_vim bundle/tlib 
git clone https://github.com/tomtom/ttags_vim bundle/ttags 
git clone https://github.com/tpope/vim-abolish bundle/abolish 
git clone https://github.com/tpope/vim-characterize bundle/characterize 
git clone https://github.com/tpope/vim-commentary bundle/commentary 
git clone https://github.com/tpope/vim-dispatch bundle/dispatch 
git clone https://github.com/tpope/vim-eunuch bundle/eunuch 
git clone https://github.com/tpope/vim-fugitive bundle/fugitive 
git clone https://github.com/tpope/vim-repeat.git bundle/repeat 
git clone https://github.com/tpope/vim-rsi bundle/rsi 
git clone https://github.com/tpope/vim-sensible bundle/sensible 
git clone https://github.com/tpope/vim-surround bundle/surround 
git clone https://github.com/tpope/vim-unimpaired bundle/unimpaired 
git clone https://github.com/wellle/targets.vim bundle/targets 
git clone https://github.com/wellle/tmux-complete.vim bundle/tmuxcomplete 
#git clone https://github.com/kana/vim-textobj-line bundle/textobj-line 
git clone https://github.com/jiangmiao/auto-pairs bundle/autopairs 
