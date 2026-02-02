source "https://rubygems.org"

# 仅保留 github-pages，它会自动包含所有兼容的 Jekyll 及插件版本
gem "github-pages", group: :jekyll_plugins

# Windows 编码兼容（Windows 用户必加）
gem "wdm", ">= 0.1.0" if Gem.win_platform?

# 为 Windows 系统补充时区数据
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

gem "jekyll-remote-theme"

gem "appraisal"

# 锁定 html-pipeline 到稳定版本
gem "html-pipeline", "~> 2.14.0"