
# 安装方式
```shell
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Bright-Nabarro/nvim.git
```

- 快捷键映射在 `lua/keymap.lua` 中
- `dap`调试重启后存在`Error ... notStop`报错，如果之后出现异常需要重启nvim

```
nvim/
    |-- init.lua 总配置控制
    |-- lua/
	|-- scheme.lua  主题（为了提前加载避免黑屏）
	|-- basic.lua	基本设置
	|-- keymap.lua	按键映射
	|-- pgconfig/	插件配置文件
	            |-- manager.lua     插件管理(使用lazy.nvim)
                |-- beauty/
                |-- func/
                |-- lsp/
```
