return {
    -- git-blame: 显示 git blame 信息
    "f-person/git-blame.nvim",
    opts = {
        enabled = false, -- 默认关闭 git blame
        date_format = "%b %-d, %Y",
        message_template = " <summary>•<author>•<date>",
        display_virtual_text = true,
        -- 可以在这里添加其他自定义配置
    },
}
