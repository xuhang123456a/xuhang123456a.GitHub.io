# 设置字符编码
$PSDefaultParameterValues['Out-File:Encoding'] = 'UTF8'

# 定义映射关系
$categories = @{
    "UE学习" = "ue,游戏开发"
    "Unity学习" = "unity,游戏开发"
    "个人成长" = "个人成长,学习"
    "娱乐" = "娱乐"
    "工作相关" = "工作"
    "编程技能学习" = "编程技能,学习"
    "编程语言学习" = "编程语言,学习"
}

$downloadsPath = "d:\xuhang123456a.GitHub.io\downloads"
$postsPath = "d:\xuhang123456a.GitHub.io\_posts"

# 遍历每个分类文件夹
foreach ($category in $categories.Keys) {
    $categoryPath = Join-Path $downloadsPath $category
    $categoryTags = $categories[$category]
    
    # 创建 _posts 中的对应文件夹
    $postsCategoryPath = Join-Path $postsPath $category
    if (-not (Test-Path $postsCategoryPath)) {
        New-Item -ItemType Directory -Path $postsCategoryPath -Force | Out-Null
    }
    
    # 处理该分类下的所有 .md 文件
    Get-ChildItem -Path $categoryPath -Filter "*.md" -File | ForEach-Object {
        $fileName = $_.Name
        $fileNameWithoutExt = $_.BaseName
        $newFileName = "2026-01-31-$fileNameWithoutExt.md"
        $sourcePath = $_.FullName
        $destPath = Join-Path $postsCategoryPath $newFileName
        
        # 读取原文件内容
        $content = Get-Content $sourcePath -Raw -Encoding UTF8
        
        # 检查是否已有 Front Matter
        if ($content -match "^---") {
            # 文件已有 Front Matter，直接复制
            Copy-Item -Path $sourcePath -Destination $destPath -Force
        } else {
            # 创建 Front Matter
            $frontMatter = @"
---
layout: post
title: $fileNameWithoutExt
categories: [$categoryTags]
date: 2026-01-31
---

"@
            # 写入新文件
            Set-Content -Path $destPath -Value ($frontMatter + $content) -Encoding UTF8
        }
        
        Write-Host "✓ 已处理: $newFileName -> _posts\$category\"
    }
}

Write-Host "完成！所有文档已配置到 _posts 中"
