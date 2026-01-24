# Z-性能优化总结

- [一些帖子]()
- [官方]()

[Unity移动端游戏性能优化简谱之 前言](https://blog.uwa4d.com/archives/EDU_Performance.html)

[Unity移动端游戏性能优化简谱](https://edu.uwa4d.com/course-intro/0/430)

[Unity移动端游戏性能优化简谱之 常见游戏内存控制](https://blog.uwa4d.com/archives/EDU_Performance2.html)

[那些年给性能埋过的坑，你跳了吗？](https://blog.uwa4d.com/archives/UWA_Pipeline12.html)

[Unity性能优化大合集，All In One !（更新至8.18）](https://blog.uwa4d.com/archives/allinone.html)

[Unity - 性能优化 - 包体，内存 - 偏静态资源的优化](https://blog.csdn.net/linjf520/article/details/122640988)

[Unity性能优化总结](https://www.zhihu.com/column/c_1944078503935981119)

# 一些帖子

[UWA：简单优化、优化简单](https://www.zhihu.com/column/uwa4d)

[UWA问答精选](https://blog.uwa4d.com/archives/TechSharing_uwa2022V1.html)

[Unity移动端性能优化总结(持续补充)](https://zhuanlan.zhihu.com/p/354146646)

[游戏优化概论](https://community.uwa4d.com/blog/detail?id=1560862974239195137&entrance=0)

[聊聊Unity底层优化：从Draw Calls到GC](https://blog.csdn.net/rf1945/article/details/90510167)

[【Unity 优化篇】 | 优化专栏《导航帖》，全面学习Unity优化技巧，让我们的Unity技术上升一个档次](https://xiaoy.blog.csdn.net/article/details/122168860?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7EPayColumn-1-122168860-blog-90510167.235%5Ev27%5Epc_relevant_default_base1&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7EPayColumn-1-122168860-blog-90510167.235%5Ev27%5Epc_relevant_default_base1&utm_relevant_index=1)

![.png](image/.png)

# 官方

[优化移动端游戏性能：图形和资源相关的专家级建议](https://blog.unity.com/cn/games/optimize-your-mobile-game-performance-expert-tips-on-graphics-and-assets)

%5BTOC%5D%0A%0A%5BUnity%E7%A7%BB%E5%8A%A8%E7%AB%AF%E6%B8%B8%E6%88%8F%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E7%AE%80%E8%B0%B1%E4%B9%8B%20%E5%89%8D%E8%A8%80%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2FEDU_Performance.html)%0A%0A%5BUnity%E7%A7%BB%E5%8A%A8%E7%AB%AF%E6%B8%B8%E6%88%8F%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E7%AE%80%E8%B0%B1%5D(https%3A%2F%2Fedu.uwa4d.com%2Fcourse-intro%2F0%2F430)%0A%0A%5BUnity%E7%A7%BB%E5%8A%A8%E7%AB%AF%E6%B8%B8%E6%88%8F%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E7%AE%80%E8%B0%B1%E4%B9%8B%20%E5%B8%B8%E8%A7%81%E6%B8%B8%E6%88%8F%E5%86%85%E5%AD%98%E6%8E%A7%E5%88%B6%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2FEDU_Performance2.html)%0A%0A%5B%E9%82%A3%E4%BA%9B%E5%B9%B4%E7%BB%99%E6%80%A7%E8%83%BD%E5%9F%8B%E8%BF%87%E7%9A%84%E5%9D%91%EF%BC%8C%E4%BD%A0%E8%B7%B3%E4%BA%86%E5%90%97%EF%BC%9F%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2FUWA_Pipeline12.html)%0A%0A%5BUnity%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E5%A4%A7%E5%90%88%E9%9B%86%EF%BC%8CAll%20In%20One%20!%EF%BC%88%E6%9B%B4%E6%96%B0%E8%87%B38.18%EF%BC%89%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2Fallinone.html)%0A%0A%5BUnity%20-%20%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%20-%20%E5%8C%85%E4%BD%93%EF%BC%8C%E5%86%85%E5%AD%98%20-%20%E5%81%8F%E9%9D%99%E6%80%81%E8%B5%84%E6%BA%90%E7%9A%84%E4%BC%98%E5%8C%96%5D(https%3A%2F%2Fblog.csdn.net%2Flinjf520%2Farticle%2Fdetails%2F122640988)%0A%0A%5BUnity%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E6%80%BB%E7%BB%93%5D(https%3A%2F%2Fwww.zhihu.com%2Fcolumn%2Fc_1944078503935981119)%0A%23%20%E4%B8%80%E4%BA%9B%E5%B8%96%E5%AD%90%0A%5BUWA%EF%BC%9A%E7%AE%80%E5%8D%95%E4%BC%98%E5%8C%96%E3%80%81%E4%BC%98%E5%8C%96%E7%AE%80%E5%8D%95%5D(https%3A%2F%2Fwww.zhihu.com%2Fcolumn%2Fuwa4d)%0A%0A%5BUWA%E9%97%AE%E7%AD%94%E7%B2%BE%E9%80%89%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2FTechSharing_uwa2022V1.html)%0A%0A%5BUnity%E7%A7%BB%E5%8A%A8%E7%AB%AF%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96%E6%80%BB%E7%BB%93%5C(%E6%8C%81%E7%BB%AD%E8%A1%A5%E5%85%85%5C)%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F354146646)%0A%0A%5B%E6%B8%B8%E6%88%8F%E4%BC%98%E5%8C%96%E6%A6%82%E8%AE%BA%5D(https%3A%2F%2Fcommunity.uwa4d.com%2Fblog%2Fdetail%3Fid%3D1560862974239195137%26entrance%3D0)%0A%0A%5B%E8%81%8A%E8%81%8AUnity%E5%BA%95%E5%B1%82%E4%BC%98%E5%8C%96%EF%BC%9A%E4%BB%8EDraw%20Calls%E5%88%B0GC%5D(https%3A%2F%2Fblog.csdn.net%2Frf1945%2Farticle%2Fdetails%2F90510167)%0A%0A%5B%E3%80%90Unity%20%E4%BC%98%E5%8C%96%E7%AF%87%E3%80%91%20%7C%20%E4%BC%98%E5%8C%96%E4%B8%93%E6%A0%8F%E3%80%8A%E5%AF%BC%E8%88%AA%E5%B8%96%E3%80%8B%EF%BC%8C%E5%85%A8%E9%9D%A2%E5%AD%A6%E4%B9%A0Unity%E4%BC%98%E5%8C%96%E6%8A%80%E5%B7%A7%EF%BC%8C%E8%AE%A9%E6%88%91%E4%BB%AC%E7%9A%84Unity%E6%8A%80%E6%9C%AF%E4%B8%8A%E5%8D%87%E4%B8%80%E4%B8%AA%E6%A1%A3%E6%AC%A1%5D(https%3A%2F%2Fxiaoy.blog.csdn.net%2Farticle%2Fdetails%2F122168860%3Fspm%3D1001.2101.3001.6661.1%26utm_medium%3Ddistribute.pc_relevant_t0.none-task-blog-2%257Edefault%257EBlogCommendFromBaidu%257EPayColumn-1-122168860-blog-90510167.235%255Ev27%255Epc_relevant_default_base1%26depth_1-utm_source%3Ddistribute.pc_relevant_t0.none-task-blog-2%257Edefault%257EBlogCommendFromBaidu%257EPayColumn-1-122168860-blog-90510167.235%255Ev27%255Epc_relevant_default_base1%26utm_relevant_index%3D1)%0A%0A!%5B054d436034347056819dd03b0bc02219.png%5D(en-resource%3A%2F%2Fdatabase%2F2326%3A1)%0A%0A%23%20%E5%AE%98%E6%96%B9%0A%5B%E4%BC%98%E5%8C%96%E7%A7%BB%E5%8A%A8%E7%AB%AF%E6%B8%B8%E6%88%8F%E6%80%A7%E8%83%BD%EF%BC%9A%E5%9B%BE%E5%BD%A2%E5%92%8C%E8%B5%84%E6%BA%90%E7%9B%B8%E5%85%B3%E7%9A%84%E4%B8%93%E5%AE%B6%E7%BA%A7%E5%BB%BA%E8%AE%AE%5D(https%3A%2F%2Fblog.unity.com%2Fcn%2Fgames%2Foptimize-your-mobile-game-performance-expert-tips-on-graphics-and-assets)
