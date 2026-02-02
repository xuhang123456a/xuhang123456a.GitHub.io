---
layout: post
title: （视频）Unity2D农场RPG游戏开发教程(Unity_2D_Game_Developer_Course_Farming_RPG)
date: 2026-01-31 23:04:22 +0000
author: xuhang
tags: ["游戏引擎", "Unity", "UE", "unity学习"]
---

# （视频）Unity2D农场RPG游戏开发教程(Unity_2D_Game_Developer_Course_Farming_RPG)

[Unity2D农场RPG游戏开发教程(Unity_2D_Game_Developer_Course_Farming_RPG)](https://www.bilibili.com/video/BV1qi4y1k7ix/?p=1&share_medium=android&share_plat=android&share_session_id=08f5ed1f-8603-4060-861c-362660a5f6a5&share_source=WEIXIN&share_tag=s_i&timestamp=1650688935&unique_k=QCcWIUJ&vd_source=a3f2cfaa857c9cb58c5c0ae53ab6d254)

---

- [1-001 Course Introduction]()
- [2-001 Unity and Visual Studio Installation]()
- [3-002 SourceTree Installation and Using SourceTree With The Supplied Unity Project]()
- [4-001 Game Architecture and Course Structure]()
- [5-001 Project Creation]()
- [6-002 Review Custom Package]()
- [7-001 Player Gameobject Set-Up]()
- [8-002 Player Class and Abstract Singleton Class]()
- [9-003 Player Animation Controllers]()
- [10-004 Events and Event Handler]()
- [11-005 Player Animation Test Harness]()
- [12-006 Basic Player Movement]()
- [13-001 Game Location Scenes]()
- [14-002 Create Farmyard Scene]()
- [15-003 Add Farmhouse and Collision Tiles]()
- [16-004 Add Scenery]()
- [17-005 Add Cinemachine Confiner]()
- [18-006 Scenery Fader]()
- [19-001 Item Details Class]()
- [20-002 Scriptable Object Item List]()
- [21-003 Item Class and Commodity Prefabs]()
- [22-004 InventoryManager Class]()
- [23-005 Custom Property Attribute Drawer]()
- [24-006 Create Item Nudge Class]()
- [25-007 Player Item Pickup]()
- [26-008 Player Inventory Bar UI]()
- [27-009 Add Collected Items To Inventory Bar]()
- [28-010 Drop Items From Inventory Bar]()
- [29-011 Reorder Items In Inventory Bar]()
- [30-012 Item Description Pop Ups]()
- [31-013 More Items In The Scene]()

# 1-001 Course Introduction

# 2-001 Unity and Visual Studio Installation

VS看类成员等的插件 CodeNav

语义着色插件 SemanticColorizer

# 3-002 SourceTree Installation and Using SourceTree With The Supplied Unity Project

SourceTree使用

# 4-001 Game Architecture and Course Structure

![图片](/assets/misc/misc-003.png)

# 5-001 Project Creation

- 项目创建
- 导入资源包
- 项目设置
    - Quality，anti aliasing（抗锯齿），
    - Graphics，Transparency Sort Mode（设置沿Y轴排序展示2D游戏的深度）
- 设置vs为外部脚本编辑器
- 设置持久化场景
- 添加虚拟摄像机
    - 修改正投影大小
    - 修改Body属性
    - 添加Pixel Perfect Camera
- 设置 Grid and Snap

# 6-002 Review Custom Package

对每个文件夹的作用进行讲解

# 7-001 Player Gameobject Set-Up

设置 Player

新建Instances层级

添加刚体组件

添加 Sorting Group（可以将玩家的不同部分归类为一个实体）

# 8-002 Player Class and Abstract Singleton Class

单例模式

# 9-003 Player Animation Controllers

给身体的每一个部件添加动画控制器

# 10-004 Events and Event Handler

事件类 发布者和订阅者模式

![图片](/assets/misc/misc-001.png)

# 11-005 Player Animation Test Harness

创建与字符串参数相关的散列值

# 12-006 Basic Player Movement

# 13-001 Game Location Scenes

Tilemap

![图片](/assets/misc/misc-002.png)

# 14-002 Create Farmyard Scene

Tilemap创建设置

不需要Collider Type

# 15-003 Add Farmhouse and Collision Tiles

添加农场房子和碰撞

优化项：设置复合碰撞器

# 16-004 Add Scenery

添加场景装饰

# 17-005 Add Cinemachine Confiner

添加摄像机的区域

# 18-006 Scenery Fader

场景装饰的淡入淡出

# 19-001 Item Details Class

物品的属性细节

# 20-002 Scriptable Object Item List

编辑 item scriptobject

# 21-003 Item Class and Commodity Prefabs

制作 item Prefab

# 22-004 InventoryManager Class

测试触发打印物品信息

# 23-005 Custom Property Attribute Drawer

自定义属性

# 24-006 Create Item Nudge Class

添加走过装饰物造成晃动效果

# 25-007 Player Item Pickup

让玩家走过时能够捡起物品

# 26-008 Player Inventory Bar UI

# 27-009 Add Collected Items To Inventory Bar

# 28-010 Drop Items From Inventory Bar

将物品从物品栏丢出

# 29-011 Reorder Items In Inventory Bar

交换物品位置

# 30-012 Item Description Pop Ups

# 31-013 More Items In The Scene