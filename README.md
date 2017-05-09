# README #

シェル関連の設定を、共有するための個人用的なスクリプト集

### What is this repository for? ###

* スクリプト(Linkdotfiles.sh)を実行することでzshやvimなどの設定ファイルをリポジトリと同期させることができます
* $HOME直下に.zshrcや.vimrcなどのシンボリックリンクを貼ります


### 使い方 ###


* oh-my-zshをインストール
* Linkdotfiles.shを実行
* (インストールされてないなら、install_dein.shでdeinをインストール)

```
#!shell
git clone https://keisuke5000LAB@bitbucket.org/keisuke5000LAB/dotfiles.git
cd ./dotfiles
sh ./Linkdotfiles.sh
```


### できてないこと
* zshがoh-my-zshに依存しているが、自動インストールができてないので、手動でやる必要あり.
* すでに設定ファイルが存在している場合に、強制的に上書きしてしまう.
