return {
    -- 代码格式化
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            objc = { "clang-format" },
            objcpp = { "clang-format" },
            dart = { "dart_format" },
            python = { "autopep8" },
            json = { "jq" },
            cmake = { "cmake_format" },
        },
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat then
                return
            end
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            if filename == "conanfile.py" then
                return
            end

            local filetype = vim.bo[bufnr].filetype
            if (filetype == "c" or filetype == "cpp") and vim.fn.filereadable(".clang-format") == 0 then
                return
            end
            return { timeout_ms = 500, lsp_fallback = true }
        end,
    },
    init = function()
        -- 创建保存自动格式化命令开关，ToggleAutoFormat
        vim.g.disable_autoformat = true
        vim.api.nvim_create_user_command("ToggleAutoFormat", function(args)
            vim.g.disable_autoformat = not vim.g.disable_autoformat
        end, {
        desc = "toggle autoformat-on-save",
    })

    -- 创建格式化命令Format
    -- :Format 格式化整个文件
    -- :Format 10,20 格式化10-20行
    vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
            }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
end,
}
