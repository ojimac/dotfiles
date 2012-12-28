#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

dotfiles = (
    'gitconfig',
    'screenrc',
    'tmux.conf'
)

# .vimディレクトリはdotfiles/.vimを使うようにシンボリックリンクを張る
print '.vim derectory symlink making...'
os.system('ln -s ~/dotfiles/.vim ~/.vim')
print 'done'
print

# .zshrcの初期設定
os.system('touch ~/.zshrc')

dot_zshrc = '''# 共通のzshrc
[ -f ${HOME}/dotfiles/zshrc ] && source ${HOME}/dotfiles/zshrc

# 環境依存のzshrc
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local'''

f = open('.zshrc', 'w')
f.write(dot_zshrc)
f.close
print '.zshrc generate...'
print

os.system('touch ~/.zshrc.local')
print '.zshrc.local generate...'
print

# .vimrcの初期設定
os.system('touch ~/.vimrc')

dot_vimrc = '''" 共通の.vimrc
if filereadable(expand('~/dotfiles/vimrc'))
  source ~/dotfiles/vimrc
endif

" 環境依存の.vimrc
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif'''
f = open('.vimrc', 'w')
f.write(dot_vimrc)
f.close
print '.vimrc generate...'

os.system('touch ~/.vimrc.local')
print '.vimrc.local generate...'

# $HOMEのdotfileはdotfilesディレクトリのシンボリックリンクにする
for dotfile in dotfiles:
    os.system('ln -s ~/dotfiles/' + dotfile + ' ~/.' + dotfile)
