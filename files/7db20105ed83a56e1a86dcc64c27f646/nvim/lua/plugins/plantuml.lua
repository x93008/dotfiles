return {
    -- plantuml-previewer.vim: 浏览器实时预览 PlantUML 图，本地渲染，保存自动刷新
    -- 需要下载graphviz应用，并确保有java环境
    "weirongxu/plantuml-previewer.vim",
    ft = "plantuml",
    dependencies = {
        "tyru/open-browser.vim", -- 打开浏览器
        "aklt/plantuml-syntax", -- PlantUML 语法高亮
    }
}
