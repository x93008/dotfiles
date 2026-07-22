return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
        -- 预览服务器监听所有网卡，局域网内其他机器可通过本机 IP + 端口访问
        vim.g.mkdp_open_to_the_world = 1
        -- 本机浏览器仍用 127.0.0.1 打开；不设此项时 open_to_the_world 会用局域网 IP 打开
        vim.g.mkdp_open_ip = "127.0.0.1"
        -- 复用已打开的预览窗口，避免每次预览都开新标签页
        vim.g.mkdp_combine_preview = 1
        -- combine_preview 要求关闭自动关闭，否则窗口不会被复用
        vim.g.mkdp_auto_close = 0
    end,
}
