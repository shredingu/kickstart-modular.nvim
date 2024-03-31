return {
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
                proseWrap = "always",
                printWidth = 80,
            },
            completion = true,
            validate = true,
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/*",
            },
        },
    },
}
