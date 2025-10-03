
# 安装方式
```shell
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Bright-Nabarro/nvim.git
```

- 快捷键映射在 `lua/keymap.lua` 中

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

# TODO
### 添加部署脚本
1. 判断环境, 计划支持 arch, ubuntu, centos, wsl额外功能, mac
2. 检测当前环境是否满足要求: 系统lua版本, nvim版本(暂时只计划支持动态版本)
