#!/usr/bin/php
<?php
	if (! array_key_exists('1', $argv)) {
		echo "ホームディレクトリ名を第一引数に指定してください\n";
		exit;
	}

	$HOME_DIR = $argv[1];
	echo 'home is ' . $HOME_DIR;

	$dotfiles = array(
		'bashrc',
		'gitconfig',
		'vimrc',
		'screenrc',
		'zshrc',
	);

	foreach($dotfiles as $dotfile) {
		echo "$dotfile copy... \n";
		exec("cp ./$dotfile $HOME_DIR.$dotfile");
	}
