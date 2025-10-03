
# 安装方式
```shell
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Bright-Nabarro/nvim.git
```

- 快捷键映射在 `lua/keymap.lua` 中

```
nvim/
  |-- lua/
    |-- init.lua 总配置控制
    |-- scheme.lua  主题（为了提前加载避免黑屏）
    |-- basic.lua	基本设置
    |-- keymap.lua	按键映射
    |-- plugins/	插件配置文件
      |-- manager.lua     插件管理(使用lazy.nvim)
      |-- beauty/
      |-- func/
      |-- lsp/
        |-- lang/   各个语言lsp的具体配置
            
```

# TODO
- [ ] 重构 keymap.lua, 统一风格
- [ ] 整理lsp的上层插件，删减不必要的插件
- [ ] 检测当前环境是否满足要求: 系统lua版本, nvim版本(暂时只计划支持动态版本), 配置部署脚本
- [ ] 完善OSC52或者其他剪贴板协议支持
- [ ] 整体重构，添加自己的工具包，简化配置

