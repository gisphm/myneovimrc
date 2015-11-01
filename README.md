[English Version README](docs/README.EN.md)

### 概述
+ 这是一份简单的neovim配置，至少目前是这样的。

### 配置思路
+ **nvimrc** 作为主体，简单的Vundle初始化及包含其他配置文件
+ **rcfiles/bundles.vim** 包含所有的插件名称和安装方式
+ **rcfiles/settings.vim** 包含所有插件的一些配置
+ **rcfiles/base.vim** 是neovim自身的一些配置，与插件无关
+ **tmp/swap**
+ **tmp/undo**
+ **tmp/backup**
+ **tmp/view**

### 感谢
+ 出色的插件管理器Vundle.vim
+ vim as ide的作者提供了相当好的一个vim配置过程
+ 安装的插件的作者们以及那些乐于助人、热心解答的人们

### TODO List
* [x] change vundle to neobundle
    > neobundle needs unite for async in neovim

* [x] fix the error that when switching modes especially switching into insert
    mode from normal mode by typing "i", the cursor may move forward, which is
    quite annoying. And even in normal mode, type "x" somewhere in a text, the
    next character may be deleted.

* [x] replace nerdtree with vimfiler

* [ ] add devicons
    - [x] add pluign
    - [ ] keep update with flagship 

* [ ] replace airline with flagship
    - [x] install flagship
    - [x] base status line settings 
    - [ ] customize statusbar for flagship 

* [ ] add startify

* [ ] optimize base nvim settings

* [ ] reveal more good plugins and use neovim more often.

### 问题与解答
如有问题，请提[issue](https://github.com/gisphm/myneovimrc/issues/new)，或者给我[email](mailto:phmfk@hotmail.com)。
欢迎[pull request](https://github.com/gisphm/myneovimrc/compare/)！！

### License
请自取自用。
