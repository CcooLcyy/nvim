# 插件

# 使用方法

当搜索结束之后使用`:noh`取消搜索高亮显示。

在不同的buffer之间进行切换可以通过`ctrl + w`和不同的`hjkl`四个方向键来选择不同方向的窗口

# key mapping

## 
leader key: `space bar`

close window: `leader w`

save file: `leader s`

save and close flie: `leader s w`

左右分割窗口：leader v

开启文件浏览器：ctrl m

切换不同buffer：leader 1~9

# 已知问题

使用toggleterm插件以及进入terminal模式的时候的leader键按下之后会有延迟，原因是在terminal模式下，在可以输入命令的情况下也会触发leader键。

fix: In terminal mode, set the leader key to the corresponding actual behavior, which is the space bar.
