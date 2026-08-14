return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = "markdown",
    build = function()
        -- 安装依赖
        vim.fn.system("cd app && npm install")
        -- 修补刷新 404 bug：SPA 把地址改写成 /<bufnr>，刷新时服务端不认 → 加 /<bufnr> -> /page/<bufnr> 302
        local routes = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app/routes.js"
        local lines = vim.fn.readfile(routes)
        local anchor = "// /_next/path"
        local marker = "// 刷新兼容：SPA 会把地址改写成 /<bufnr>，刷新时 302 重定向回 /page/<bufnr>"
        local patched = false
        for i, line in ipairs(lines) do
            if line:find(marker, 1, true) then
                patched = true
                break
            end
        end
        if not patched then
            local newblock = {
                "",
                marker,
                "use((req, res, next) => {",
                "  if (/^\\/\\d+$/.test(req.asPath)) {",
                "    res.writeHead(302, { Location: '/page' + req.asPath })",
                "    return res.end()",
                "  }",
                "  next()",
                "})",
            }
            for i, line in ipairs(lines) do
                if line == anchor then
                    local head = {}
                    for j = 1, i - 1 do
                        head[j] = lines[j]
                    end
                    local tail = {}
                    for j = i, #lines do
                        tail[#tail + 1] = lines[j]
                    end
                    lines = vim.list_extend(vim.list_extend(head, newblock), tail)
                    break
                end
            end
            vim.fn.writefile(lines, routes)
        end
    end,
    init = function()
        -- 预览服务器监听所有网卡，局域网内其他机器可通过本机 IP + 端口访问
        vim.g.mkdp_open_to_the_world = 1
        -- 本机浏览器仍用 127.0.0.1 打开；不设此项时 open_to_the_world 会用局域网 IP 打开
        vim.g.mkdp_open_ip = "127.0.0.1"
        -- 固定端口：随机端口时手动/LAN 访问难以拼 URL；设固定端口便于访问
        vim.g.mkdp_port = "8899"
        -- 自定义 markdown 样式：基于插件默认 markdown.css，额外把正文最大宽度从 900px 放宽到 1200px
        vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/assets/markdown-preview.css"
        -- 复用已打开的预览窗口，避免每次预览都开新标签页
        vim.g.mkdp_combine_preview = 1
        -- combine_preview 要求关闭自动关闭，否则窗口不会被复用
        vim.g.mkdp_auto_close = 0
    end,
}
