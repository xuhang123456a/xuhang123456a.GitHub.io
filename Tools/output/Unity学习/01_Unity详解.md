# 01 Unity详解

- [Unity中的生命周期函数]()
- [Unity 序列化（Serialize）]()
- [unity官方api]()
- [Unity3D工程各子文件说明]()
- [Unity文件、文件引用]()
- [Prefab 梳理]()
- [untiy中各种坐标系及其转换]()
- [Unity各平台下的Application.xxxxPath解析]()
- [Unity打包机制]()
- [Unity程序集]()

# Unity中的生命周期函数

[详解Unity中的生命周期函数](https://blog.csdn.net/weixin_43147385/article/details/123928964)

[【Unity】Unity 生命周期](https://blog.csdn.net/xiaoyaoACi/article/details/119324146)

1. Reset()
2. Awake()
    脚本实例被载入时调用，仅一次
3. OnEnable()
4. Start()
5. FixedUpdate()
    FixedUpdate 固定时间可修改，Edit->Project Setting->time->Fixed timestep。
6. Update()
7. LateUpdate()
8. OnGUI()
9. OnDisable()
10. OnDestroy()

# Unity 序列化（Serialize）

自定义数据类型无法显示在inspector面板里，需要对定义数据类型的类或者结构体使用[System.Serializable]。

[unity3d学习日记：使用[System.Serializable]在inspector面板内显示自定义数据类型类实例对象的内部数据](https://blog.csdn.net/oldherowang/article/details/78005485)

[Unity 序列化（Serialize）介绍、用途](https://blog.csdn.net/l773575310/article/details/71774484)

[深入Unity序列化](https://zhuanlan.zhihu.com/p/76247383)

# unity官方api

[unity官方api介绍](https://docs.unity3d.com/ScriptReference/SerializeField.html)

# Unity3D工程各子文件说明

[Unity3D工程各子文件说明](https://blog.csdn.net/zz13995900221/article/details/79658777)

# Unity文件、文件引用

[Unity文件、文件引用、Meta详解](https://blog.uwa4d.com/archives/USparkle_inf_UnityEngine.html)

# Prefab 梳理

[新版Prefab的一些梳理](https://zhuanlan.zhihu.com/p/53824013)

# untiy中各种坐标系及其转换

[untiy中各种坐标系及其转换](https://www.jianshu.com/p/c91d3e93ee32)

# Unity各平台下的Application.xxxxPath解析

[Unity各平台下的Application.xxxxPath解析](https://blog.csdn.net/aaa27987/article/details/122337859?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122337859-blog-52253674.235%5Ev38%5Epc_relevant_sort_base3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122337859-blog-52253674.235%5Ev38%5Epc_relevant_sort_base3&utm_relevant_index=1)

# Unity打包机制

[Unity 资源打包机制](https://juejin.cn/post/7135337912048189447)

# Unity程序集

[Unity的程序集剖析]()

%5BTOC%5D%0A%23%20Unity%E4%B8%AD%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E5%87%BD%E6%95%B0%0A%5B%E8%AF%A6%E8%A7%A3Unity%E4%B8%AD%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E5%87%BD%E6%95%B0%5D(https%3A%2F%2Fblog.csdn.net%2Fweixin_43147385%2Farticle%2Fdetails%2F123928964)%0A%5B%E3%80%90Unity%E3%80%91Unity%20%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%5D(https%3A%2F%2Fblog.csdn.net%2FxiaoyaoACi%2Farticle%2Fdetails%2F119324146)%0A1.%20Reset()%0A2.%20Awake()%0A%E8%84%9A%E6%9C%AC%E5%AE%9E%E4%BE%8B%E8%A2%AB%E8%BD%BD%E5%85%A5%E6%97%B6%E8%B0%83%E7%94%A8%EF%BC%8C%E4%BB%85%E4%B8%80%E6%AC%A1%0A3.%20OnEnable()%0A4.%20Start()%0A5.%20FixedUpdate()%0AFixedUpdate%20%E5%9B%BA%E5%AE%9A%E6%97%B6%E9%97%B4%E5%8F%AF%E4%BF%AE%E6%94%B9%EF%BC%8CEdit-%3EProject%20Setting-%3Etime-%3EFixed%20timestep%E3%80%82%0A6.%20Update()%0A7.%20LateUpdate()%0A8.%20OnGUI()%0A9.%20OnDisable()%0A10.%20OnDestroy()%0A%0A%0A%23%20Unity%20%E5%BA%8F%E5%88%97%E5%8C%96%EF%BC%88Serialize%EF%BC%89%0A%E8%87%AA%E5%AE%9A%E4%B9%89%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E6%97%A0%E6%B3%95%E6%98%BE%E7%A4%BA%E5%9C%A8inspector%E9%9D%A2%E6%9D%BF%E9%87%8C%EF%BC%8C%E9%9C%80%E8%A6%81%E5%AF%B9%E5%AE%9A%E4%B9%89%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E7%9A%84%E7%B1%BB%E6%88%96%E8%80%85%E7%BB%93%E6%9E%84%E4%BD%93%E4%BD%BF%E7%94%A8%5BSystem.Serializable%5D%E3%80%82%0A%5Bunity3d%E5%AD%A6%E4%B9%A0%E6%97%A5%E8%AE%B0%EF%BC%9A%E4%BD%BF%E7%94%A8%5BSystem.Serializable%5D%E5%9C%A8inspector%E9%9D%A2%E6%9D%BF%E5%86%85%E6%98%BE%E7%A4%BA%E8%87%AA%E5%AE%9A%E4%B9%89%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E7%B1%BB%E5%AE%9E%E4%BE%8B%E5%AF%B9%E8%B1%A1%E7%9A%84%E5%86%85%E9%83%A8%E6%95%B0%E6%8D%AE%5D(https%3A%2F%2Fblog.csdn.net%2Foldherowang%2Farticle%2Fdetails%2F78005485)%0A%5BUnity%20%E5%BA%8F%E5%88%97%E5%8C%96%EF%BC%88Serialize%EF%BC%89%E4%BB%8B%E7%BB%8D%E3%80%81%E7%94%A8%E9%80%94%5D(https%3A%2F%2Fblog.csdn.net%2Fl773575310%2Farticle%2Fdetails%2F71774484)%0A%5B%E6%B7%B1%E5%85%A5Unity%E5%BA%8F%E5%88%97%E5%8C%96%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F76247383)%0A%23%20unity%E5%AE%98%E6%96%B9api%0A%5Bunity%E5%AE%98%E6%96%B9api%E4%BB%8B%E7%BB%8D%5D(https%3A%2F%2Fdocs.unity3d.com%2FScriptReference%2FSerializeField.html)%0A%0A%0A%23%20Unity3D%E5%B7%A5%E7%A8%8B%E5%90%84%E5%AD%90%E6%96%87%E4%BB%B6%E8%AF%B4%E6%98%8E%0A%5BUnity3D%E5%B7%A5%E7%A8%8B%E5%90%84%E5%AD%90%E6%96%87%E4%BB%B6%E8%AF%B4%E6%98%8E%5D(https%3A%2F%2Fblog.csdn.net%2Fzz13995900221%2Farticle%2Fdetails%2F79658777)%0A%0A%23%20Unity%E6%96%87%E4%BB%B6%E3%80%81%E6%96%87%E4%BB%B6%E5%BC%95%E7%94%A8%0A%5BUnity%E6%96%87%E4%BB%B6%E3%80%81%E6%96%87%E4%BB%B6%E5%BC%95%E7%94%A8%E3%80%81Meta%E8%AF%A6%E8%A7%A3%5D(https%3A%2F%2Fblog.uwa4d.com%2Farchives%2FUSparkle_inf_UnityEngine.html)%0A%0A%23%20Prefab%20%E6%A2%B3%E7%90%86%0A%5B%E6%96%B0%E7%89%88Prefab%E7%9A%84%E4%B8%80%E4%BA%9B%E6%A2%B3%E7%90%86%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F53824013)%0A%0A%23%20untiy%E4%B8%AD%E5%90%84%E7%A7%8D%E5%9D%90%E6%A0%87%E7%B3%BB%E5%8F%8A%E5%85%B6%E8%BD%AC%E6%8D%A2%0A%5Buntiy%E4%B8%AD%E5%90%84%E7%A7%8D%E5%9D%90%E6%A0%87%E7%B3%BB%E5%8F%8A%E5%85%B6%E8%BD%AC%E6%8D%A2%5D(https%3A%2F%2Fwww.jianshu.com%2Fp%2Fc91d3e93ee32)%0A%0A%23%20Unity%E5%90%84%E5%B9%B3%E5%8F%B0%E4%B8%8B%E7%9A%84Application.xxxxPath%E8%A7%A3%E6%9E%90%0A%5BUnity%E5%90%84%E5%B9%B3%E5%8F%B0%E4%B8%8B%E7%9A%84Application.xxxxPath%E8%A7%A3%E6%9E%90%5D(https%3A%2F%2Fblog.csdn.net%2Faaa27987%2Farticle%2Fdetails%2F122337859%3Fspm%3D1001.2101.3001.6661.1%26utm_medium%3Ddistribute.pc_relevant_t0.none-task-blog-2%257Edefault%257ECTRLIST%257ERate-1-122337859-blog-52253674.235%255Ev38%255Epc_relevant_sort_base3%26depth_1-utm_source%3Ddistribute.pc_relevant_t0.none-task-blog-2%257Edefault%257ECTRLIST%257ERate-1-122337859-blog-52253674.235%255Ev38%255Epc_relevant_sort_base3%26utm_relevant_index%3D1)%0A%0A%23%20Unity%E6%89%93%E5%8C%85%E6%9C%BA%E5%88%B6%0A%5BUnity%20%E8%B5%84%E6%BA%90%E6%89%93%E5%8C%85%E6%9C%BA%E5%88%B6%5D(https%3A%2F%2Fjuejin.cn%2Fpost%2F7135337912048189447)%0A%0A%23%20Unity%E7%A8%8B%E5%BA%8F%E9%9B%86%0A%5BUnity%E7%9A%84%E7%A8%8B%E5%BA%8F%E9%9B%86%E5%89%96%E6%9E%90%5D(https%3A%2F%2Fzhuanlan.zhihu.com%2Fp%2F547508501)
