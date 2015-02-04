### 概述
这是一份简单的neovim配置，至少目前是这样的。

### 插件列表
目前已经添加的插件有：
+ 插件管理器 [Vundle][1]
+ 状态栏 [vim-airline][2]
+ 缓冲区插件 [vim-bufferline][3]
+ 主题包 [vim-colorschemes][9]
+ STL语法 [STL-Syntax][7]
+ 缩进连接线 [vim-indent-guides][6]
+ Git插件 [vim-fugitive][4]
+ sparkup（更快地写html）[sparkup][8]
+ 文件版本控制状态显示 [vim-gitgutter][11]
+ 文件夹管理器 [nerdtree][5]
+ repeat [vim-repeat][10]

### 配置思路
+ nvimrc 作为主体，简单的Vundle初始化及包含其他配置文件
+ nvimrc.bundles 包含所有的插件名称和安装方式
+ nvimrc.bundles.local 包含所有插件的一些配置
+ nvimrc.local 是neovim自身的一些配置，与插件无关
+ .nvim/nvim_swap 是neovim的交换文件存放位置
+ .nvim/nvim_undo 是neovim的撤销文件存放位置
+ .nvim/nvim_backup 是neovim的备份文件存放位置

### 感谢
+ 出色的插件管理器Vundle.vim
+ vim as ide的作者提供了相当好的一个vim配置过程
+ 安装的插件的作者们以及那些乐于助人、热心解答的人们

### 问题与解答
如有问题，请提issue，或者给我[email](phmfk@hotmail.com)。
欢迎pull request！！

### License
请自取自用。

[1]: https://github.com/gmarik/Vundle.vim
[2]: https://github.com/bling/vim-airline
[3]: https://github.com/bling/vim-bufferline
[4]: https://github.com/tpope/vim-fugitive
[5]: https://github.com/scrooloose/nerdtree
[6]: https://github.com/nathanaelkane/vim-indent-guides
[7]: https://github.com/Mizuchi/STL-Syntax
[8]: https://github.com/rstacruz/sparkup
[9]: https://github.com/flazz/vim-colorschemes
[10]: https://github.com/tpope/vim-repeat
[11]: https://github.com/airblade/vim-gitgutter
