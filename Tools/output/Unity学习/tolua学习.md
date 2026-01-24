# tolua学习

[Unity3D热更新技术点——ToLua（上）](https://zhuanlan.zhihu.com/p/42472089)

[Unity3D热更新技术点——ToLua（下）](https://zhuanlan.zhihu.com/p/42472115)

# tolua文件目录

Tolua集成主要分为两部分，一部分是运行时需要的代码包括一些手写的和自动生成的绑定代码，另一部分是编辑器相关代码，主要提供代码生成、编译lua文件等操作，具体就是Unity编辑器中提供的功能。

接下来我们具体介绍一下Tolua文件列表中文件的用途：

1. Editor下Custom/CustomSettings.cs 自定义配置文件，用于定义哪些类作为静态类型、哪些类需要导出、哪些附加委托需要导出等

[ToLua使用笔记（中）](https://blog.csdn.net/u012138730/article/details/81183094)

[[转]Lua和Lua JIT及优化指南�](https://www.cnblogs.com/zhaoqingqing/p/10397867.html)�

%5BUnity3D%E7%83%AD%E6%9B%B4%E6%96%B0%E6%8A%80%E6%9C%AF%E7%82%B9%E2%80%94%E2%80%94ToLua%EF%BC%88%E4%B8%8A%EF%BC%89%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F42472089)%0A%5BUnity3D%E7%83%AD%E6%9B%B4%E6%96%B0%E6%8A%80%E6%9C%AF%E7%82%B9%E2%80%94%E2%80%94ToLua%EF%BC%88%E4%B8%8B%EF%BC%89%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F42472115)%0A%23%20tolua%E6%96%87%E4%BB%B6%E7%9B%AE%E5%BD%95%0ATolua%E9%9B%86%E6%88%90%E4%B8%BB%E8%A6%81%E5%88%86%E4%B8%BA%E4%B8%A4%E9%83%A8%E5%88%86%EF%BC%8C%E4%B8%80%E9%83%A8%E5%88%86%E6%98%AF%E8%BF%90%E8%A1%8C%E6%97%B6%E9%9C%80%E8%A6%81%E7%9A%84%E4%BB%A3%E7%A0%81%E5%8C%85%E6%8B%AC%E4%B8%80%E4%BA%9B%E6%89%8B%E5%86%99%E7%9A%84%E5%92%8C%E8%87%AA%E5%8A%A8%E7%94%9F%E6%88%90%E7%9A%84%E7%BB%91%E5%AE%9A%E4%BB%A3%E7%A0%81%EF%BC%8C%E5%8F%A6%E4%B8%80%E9%83%A8%E5%88%86%E6%98%AF%E7%BC%96%E8%BE%91%E5%99%A8%E7%9B%B8%E5%85%B3%E4%BB%A3%E7%A0%81%EF%BC%8C%E4%B8%BB%E8%A6%81%E6%8F%90%E4%BE%9B%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90%E3%80%81%E7%BC%96%E8%AF%91lua%E6%96%87%E4%BB%B6%E7%AD%89%E6%93%8D%E4%BD%9C%EF%BC%8C%E5%85%B7%E4%BD%93%E5%B0%B1%E6%98%AFUnity%E7%BC%96%E8%BE%91%E5%99%A8%E4%B8%AD%E6%8F%90%E4%BE%9B%E7%9A%84%E5%8A%9F%E8%83%BD%E3%80%82%0A%0A%E6%8E%A5%E4%B8%8B%E6%9D%A5%E6%88%91%E4%BB%AC%E5%85%B7%E4%BD%93%E4%BB%8B%E7%BB%8D%E4%B8%80%E4%B8%8BTolua%E6%96%87%E4%BB%B6%E5%88%97%E8%A1%A8%E4%B8%AD%E6%96%87%E4%BB%B6%E7%9A%84%E7%94%A8%E9%80%94%EF%BC%9A%0A%0A1.%20Editor%E4%B8%8BCustom%2FCustomSettings.cs%20%E8%87%AA%E5%AE%9A%E4%B9%89%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AE%9A%E4%B9%89%E5%93%AA%E4%BA%9B%E7%B1%BB%E4%BD%9C%E4%B8%BA%E9%9D%99%E6%80%81%E7%B1%BB%E5%9E%8B%E3%80%81%E5%93%AA%E4%BA%9B%E7%B1%BB%E9%9C%80%E8%A6%81%E5%AF%BC%E5%87%BA%E3%80%81%E5%93%AA%E4%BA%9B%E9%99%84%E5%8A%A0%E5%A7%94%E6%89%98%E9%9C%80%E8%A6%81%E5%AF%BC%E5%87%BA%E7%AD%89%0A%0A%5BToLua%E4%BD%BF%E7%94%A8%E7%AC%94%E8%AE%B0%EF%BC%88%E4%B8%AD%EF%BC%89%5D(https%3A%2F%2Fblog.csdn.net%2Fu012138730%2Farticle%2Fdetails%2F81183094)%0A%0A%5B%5B%E8%BD%AC%5DLua%E5%92%8CLua%20JIT%E5%8F%8A%E4%BC%98%E5%8C%96%E6%8C%87%E5%8D%97%C2%A0%5D(https%3A%2F%2Fwww.cnblogs.com%2Fzhaoqingqing%2Fp%2F10397867.html)%0A%0A%5B%E3%80%90%E6%B8%B8%E6%88%8F%E5%BC%80%E5%8F%91%E9%AB%98%E9%98%B6%E3%80%91%E4%BB%8E%E9%9B%B6%E5%88%B0%E4%B8%80%E6%95%99%E4%BD%A0Unity%E4%BD%BF%E7%94%A8ToLua%E5%AE%9E%E7%8E%B0%E7%83%AD%E6%9B%B4%E6%96%B0%EF%BC%88%E5%90%ABDemo%E5%B7%A5%E7%A8%8B%20%7C%20LuaFramework%20%7C%20%E5%A2%9E%E9%87%8F%20%7C%20HotUpdate%EF%BC%89%5D(https%3A%2F%2Fblog.csdn.net%2Flinxinfa%2Farticle%2Fdetails%2F119493890%3Futm_medium%3Ddistribute.pc_relevant.none-task-blog-2~default~baidujs_title~default-1-119493890-blog-53143307.pc_relevant_default%26spm%3D1001.2101.3001.4242.2%26utm_relevant_index%3D4)
