# README #

シェル関連の設定を、共有するための個人用的なスクリプト集

### What is this repository for? ###

* スクリプト(Linkdotfiles.sh)を実行することでzshやvimなどの設定ファイルをリポジトリと同期させることができます
* $HOME直下に.zshrcや.vimrcなどのシンボリックリンクを貼ります


### 使い方 ###

* Linkdotfiles.shを実行するだけ

```
#!shell
git clone https://keisuke5000LAB@bitbucket.org/keisuke5000LAB/dotfiles.git
cd ./dotfiles
sh ./Linkdotfiles.sh
```


### できてないこと
* すでに設定ファイルが存在している場合に、強制的に上書きしてしまう.
