return {
    -- plantuml.nvim: 浏览器实时预览 PlantUML 图（WebSocket 自动更新）
    "charlesnicholson/plantuml.nvim",
    ft = "plantuml",
    opts = {
        -- 默认走公共 PlantUML Server，无需本地 Java/plantuml.jar
        -- 敏感内容可改用 Docker 本地 Server：
        -- use_docker = true,
        -- docker_image = "plantuml/plantuml-server:jetty",
        -- docker_port = 8080,
    },
}
