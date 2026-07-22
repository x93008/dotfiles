return {
    "kevalin/mermaid.nvim",
    -- 不用 ft 懒加载：插件自身的 ftdetect 需要在启动时注册 .mmd/.mermaid 文件类型
    config = function()
        require("mermaid").setup({
            -- lint 依赖外部 mmdc，未安装时禁用，避免噪音
            lint = { enabled = false },
        })
    end,
}
