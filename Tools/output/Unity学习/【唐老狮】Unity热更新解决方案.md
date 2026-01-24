# 【唐老狮】Unity热更新解决方案

[【唐老狮】Unity热更新解决方案](https://www.bilibili.com/medialist/play/79983517?from=space&business=space_series&business_id=602243&desc=1)

本地工程路径：

_E:\CodeProject\UnityProject\BilibiliStudy\ABLesson_

- [【唐老狮】Unity热更新解决方案]()
- [【唐老狮】Unity热更新之AssetBundle]()
    - [P1 AB包理论基础]()
    - [P2 AB包资源打�]()�
    - [P3 AB包资源加载]()
    - [P4 AB包依赖]()
    - [P5 AB包资源管理器-同步加载]()
- [Unity热更新之Lua语法]()
    - [P3 变量]()
    - [P4 字符串]()
    - [P5 运算符]()
    - [P8 函数]()
    - [P9 table表]()
    - [P13 table表的公共操作]()
    - [P14 多脚本执行]()
    - [P16 协同程序]()
    - [P16 协同程序]()
    - [P17 lua面向对象之封�]()�
    - [P18 lua面向对象之继承]()
    - [P19 lua面向对象之多态]()
    - [P22 lua自带库]()
- [出现的一些问题]()

---

# 【唐老狮】Unity热更新解决方案

![.png](image/.png)

---

# 【唐老狮】Unity热更新之AssetBundle

## P1 AB包理论基础

![-1.png](image/-1.png)

## P2 AB包资源打包

![-2.png](image/-2.png)

打包后会默认打出来一个和Output Path名一样的主包文件以及真正的AB包资源和配置文件

**AssetBundles选项解释**：

Build Target：目标平台

Output Path：输出路径

Clear Folders：打包的时候是否清空文件夹

Copy to StreamingAssets：是否复制到StreamingAssets中

Compression：压缩方式

- No Compression：不压缩
- LZMA：压缩最小，解压缩慢，一个资源就得解压所有
- LZ4：解压缩快，需要哪个资源解压哪个

E T I：资源包中是否包含资源类型信息

F R：重新打包时是否重新构建（不会删除已不存在的旧包）

I T T C：增量构建检查时，忽略类型数的更改

A H：把文件哈希值附加到资源包名上

S M：打包时报错则打包失败

D R B：运行时构建

## P3 AB包资源加载

AB包不能够重复加载，会报错

## P4 AB包依赖

## P5 AB包资源管理器-同步加载

---

# Unity热更新之Lua语法

[【唐老狮】Unity热更新之Lua语法](https://www.bilibili.com/medialist/play/79983517?from=space&business=space_series&business_id=602243&desc=1)

## P3 变量

变量类型

1. nil
2. number
3. string
4. boolean
5. function
6. table
7. userdata
8. thread

## P4 字符串

lua中一个汉字占三个字符

lua支持转义字符

多行打印

`s = [[ 我是 徐航 ]]`

常用字符串方法

```
* string.upper()
* string.lower()
* string.reverse()
* string.find()
* string.sub()
* string.rep() (字符串重复)
* string.gsub() (字符串修改)
* string.byte() (字符转 ASCII码)
* string.char() (ASCII码转 字符)
```

## P5 运算符

- 算术运算符
    `+ - * / % ^(幂运算)`
- 条件运算符
    `> < >= <= == ~=`
- 逻辑运算符
    `&& || !` 对应
    `and or not`
- 位运算符
    lua不支持位运算符
- 三目运算符
    lua不支持三目运算符

## P8 函数

- 变长参数

```
function F7( ... )
    --用一个表存起来再使用变长参数
    arg = { ... }
    for i = 1,#arg do
        print(arg[i])
    end
end
F7(1,"123",true,4,5,6)
```

- 闭包
    函数返回函数

```
function f9(x)
    return function(y)
        return x + y
    end
end
```

## P9 table表

`#表的坑`

![-3.png](image/-3.png)

![-4.png](image/-4.png)

## P13 table表的公共操作

![-5.png](image/-5.png)

![-6.png](image/-6.png)

## P14 多脚本执行

-- 返回值是Boolean 意思是该脚本是否被执行

package.loaded["test"]

-- 卸载已经执行过的脚本

package.loaded["test"] = nil

## P16 协同程序

func = function()

print(123)

end

co = coroutine.create(func) (thread类型)

coroutine.resume() --重启协程

coroutine.yield() --挂起协程

coroutine.status(协程对象) --获取协程状态

dead、suspended、running

coroutine.running() --获取当前正在运行的协程的线程号

co2 = coroutine.wrap(func) (function类型)

## P16 协同程序

- 元表概念
- 特定操作-__tostring（当子表要被当做字符串使用时，会默认调用这个元表中的tostring方法）
- 特定操作-__call（当子表被当做一个函数来使用时，会默认调用__call中的内容）（当希望传参数时，要记住默认第一个参数，是调用者自己）
- 运算符重载-__add（相当于运算符重载，当子表使用+运算符时会调用该方法）
    __sub，__mul，__div，__mod，__pow（+，-，* ，/，%）
    __eq，__lt，__le，__concat（==，<，<=，.. ）
    (如果要用条件运算符来比较两个对象，这两个对象的元表要一致才能准确调用方法)
- 特定操作-__index（当子表中找不到某一个属性时会到元表中__index指定的表去找索引）（__index的赋值，写在表外面来初始化）
    __newindex（当赋值时，如果赋值一个不存在的索引，那么会把这个值赋值到newindex所指的表中，不会修改自己）
- getnetatable
- rawget（只在表内找而不去元表查）
- rawset

## P17 lua面向对象之封装

## P18 lua面向对象之继承

## P19 lua面向对象之多态

## P22 lua自带库

os.time()

os.date()

---

# 出现的一些问题

[创建新项目时出现 2 个错误](https://forum.unity.com/threads/gets-2-errors-while-creating-new-project.1198063/)

![-7.png](image/-7.png)

---

**问题描述**：

学习【唐老狮】Unity热更新之AssetBundle P3时

点击运行图片没有加载显示出来

**解决方案**：

将图片的TextureType修改为2d/UI模式

![-8.png](image/-8.png)

%5B%E3%80%90%E5%94%90%E8%80%81%E7%8B%AE%E3%80%91Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88%5D(https%3A%2F%2Fwww.bilibili.com%2Fmedialist%2Fplay%2F79983517%3Ffrom%3Dspace%26business%3Dspace_series%26business_id%3D602243%26desc%3D1)%0A%E6%9C%AC%E5%9C%B0%E5%B7%A5%E7%A8%8B%E8%B7%AF%E5%BE%84%EF%BC%9A%20%0A*E%3A%5CCodeProject%5CUnityProject%5CBilibiliStudy%5CABLesson*%0A%5BTOC%5D%0A%0A*%20*%20*%0A%0A%23%20%E3%80%90%E5%94%90%E8%80%81%E7%8B%AE%E3%80%91Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88%0A!%5Ba02f2d7fecbaf32cee37d96d38399bef.png%5D(en-resource%3A%2F%2Fdatabase%2F983%3A1)%0A***%0A%23%20%E3%80%90%E5%94%90%E8%80%81%E7%8B%AE%E3%80%91Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E4%B9%8BAssetBundle%0A%23%23%20P1%20AB%E5%8C%85%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80%20%0A!%5Bbc6df88a22841345e2952aea04b15547.png%5D(en-resource%3A%2F%2Fdatabase%2F985%3A1)%0A%23%23%20P2%20AB%E5%8C%85%E8%B5%84%E6%BA%90%E6%89%93%E5%8C%85%0A!%5B68fef6f53b2c37bb914a1476d7545db7.png%5D(en-resource%3A%2F%2Fdatabase%2F989%3A1)%0A%E6%89%93%E5%8C%85%E5%90%8E%E4%BC%9A%E9%BB%98%E8%AE%A4%E6%89%93%E5%87%BA%E6%9D%A5%E4%B8%80%E4%B8%AA%E5%92%8COutput%20Path%E5%90%8D%E4%B8%80%E6%A0%B7%E7%9A%84%E4%B8%BB%E5%8C%85%E6%96%87%E4%BB%B6%E4%BB%A5%E5%8F%8A%E7%9C%9F%E6%AD%A3%E7%9A%84AB%E5%8C%85%E8%B5%84%E6%BA%90%E5%92%8C%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%0A**AssetBundles%E9%80%89%E9%A1%B9%E8%A7%A3%E9%87%8A**%EF%BC%9A%0ABuild%20Target%EF%BC%9A%E7%9B%AE%E6%A0%87%E5%B9%B3%E5%8F%B0%0AOutput%20Path%EF%BC%9A%E8%BE%93%E5%87%BA%E8%B7%AF%E5%BE%84%0AClear%20Folders%EF%BC%9A%E6%89%93%E5%8C%85%E7%9A%84%E6%97%B6%E5%80%99%E6%98%AF%E5%90%A6%E6%B8%85%E7%A9%BA%E6%96%87%E4%BB%B6%E5%A4%B9%0ACopy%20to%20StreamingAssets%EF%BC%9A%E6%98%AF%E5%90%A6%E5%A4%8D%E5%88%B6%E5%88%B0StreamingAssets%E4%B8%AD%0A%0ACompression%EF%BC%9A%E5%8E%8B%E7%BC%A9%E6%96%B9%E5%BC%8F%0A%0A*%20No%20Compression%EF%BC%9A%E4%B8%8D%E5%8E%8B%E7%BC%A9%0A*%20LZMA%EF%BC%9A%E5%8E%8B%E7%BC%A9%E6%9C%80%E5%B0%8F%EF%BC%8C%E8%A7%A3%E5%8E%8B%E7%BC%A9%E6%85%A2%EF%BC%8C%E4%B8%80%E4%B8%AA%E8%B5%84%E6%BA%90%E5%B0%B1%E5%BE%97%E8%A7%A3%E5%8E%8B%E6%89%80%E6%9C%89%0A*%20LZ4%EF%BC%9A%E8%A7%A3%E5%8E%8B%E7%BC%A9%E5%BF%AB%EF%BC%8C%E9%9C%80%E8%A6%81%E5%93%AA%E4%B8%AA%E8%B5%84%E6%BA%90%E8%A7%A3%E5%8E%8B%E5%93%AA%E4%B8%AA%0A%0AE%20T%20I%EF%BC%9A%E8%B5%84%E6%BA%90%E5%8C%85%E4%B8%AD%E6%98%AF%E5%90%A6%E5%8C%85%E5%90%AB%E8%B5%84%E6%BA%90%E7%B1%BB%E5%9E%8B%E4%BF%A1%E6%81%AF%0AF%20R%EF%BC%9A%E9%87%8D%E6%96%B0%E6%89%93%E5%8C%85%E6%97%B6%E6%98%AF%E5%90%A6%E9%87%8D%E6%96%B0%E6%9E%84%E5%BB%BA%EF%BC%88%E4%B8%8D%E4%BC%9A%E5%88%A0%E9%99%A4%E5%B7%B2%E4%B8%8D%E5%AD%98%E5%9C%A8%E7%9A%84%E6%97%A7%E5%8C%85%EF%BC%89%0AI%20T%20T%20C%EF%BC%9A%E5%A2%9E%E9%87%8F%E6%9E%84%E5%BB%BA%E6%A3%80%E6%9F%A5%E6%97%B6%EF%BC%8C%E5%BF%BD%E7%95%A5%E7%B1%BB%E5%9E%8B%E6%95%B0%E7%9A%84%E6%9B%B4%E6%94%B9%0AA%20H%EF%BC%9A%E6%8A%8A%E6%96%87%E4%BB%B6%E5%93%88%E5%B8%8C%E5%80%BC%E9%99%84%E5%8A%A0%E5%88%B0%E8%B5%84%E6%BA%90%E5%8C%85%E5%90%8D%E4%B8%8A%0AS%20M%EF%BC%9A%E6%89%93%E5%8C%85%E6%97%B6%E6%8A%A5%E9%94%99%E5%88%99%E6%89%93%E5%8C%85%E5%A4%B1%E8%B4%A5%0AD%20R%20B%EF%BC%9A%E8%BF%90%E8%A1%8C%E6%97%B6%E6%9E%84%E5%BB%BA%0A%0A%23%23%20P3%20AB%E5%8C%85%E8%B5%84%E6%BA%90%E5%8A%A0%E8%BD%BD%0AAB%E5%8C%85%E4%B8%8D%E8%83%BD%E5%A4%9F%E9%87%8D%E5%A4%8D%E5%8A%A0%E8%BD%BD%EF%BC%8C%E4%BC%9A%E6%8A%A5%E9%94%99%0A%0A%23%23%20P4%20AB%E5%8C%85%E4%BE%9D%E8%B5%96%0A%0A%23%23%20P5%20AB%E5%8C%85%E8%B5%84%E6%BA%90%E7%AE%A1%E7%90%86%E5%99%A8-%E5%90%8C%E6%AD%A5%E5%8A%A0%E8%BD%BD%0A%0A%0A%0A%0A%0A***%0A%23%20Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E4%B9%8BLua%E8%AF%AD%E6%B3%95%0A%5B%E3%80%90%E5%94%90%E8%80%81%E7%8B%AE%E3%80%91Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E4%B9%8BLua%E8%AF%AD%E6%B3%95%5D(https%3A%2F%2Fwww.bilibili.com%2Fmedialist%2Fplay%2F79983517%3Ffrom%3Dspace%26business%3Dspace_series%26business_id%3D602243%26desc%3D1)%0A%23%23%20P3%20%E5%8F%98%E9%87%8F%0A%E5%8F%98%E9%87%8F%E7%B1%BB%E5%9E%8B%0A1.%20nil%0A2.%20number%0A3.%20string%0A4.%20boolean%0A5.%20function%0A6.%20table%0A7.%20userdata%0A8.%20thread%0A%0A%23%23%20P4%20%E5%AD%97%E7%AC%A6%E4%B8%B2%0Alua%E4%B8%AD%E4%B8%80%E4%B8%AA%E6%B1%89%E5%AD%97%E5%8D%A0%E4%B8%89%E4%B8%AA%E5%AD%97%E7%AC%A6%0Alua%E6%94%AF%E6%8C%81%E8%BD%AC%E4%B9%89%E5%AD%97%E7%AC%A6%0A%E5%A4%9A%E8%A1%8C%E6%89%93%E5%8D%B0%0A%60s%20%3D%20%5B%5B%0A%E6%88%91%E6%98%AF%0A%E5%BE%90%E8%88%AA%0A%5D%5D%60%0A%E5%B8%B8%E7%94%A8%E5%AD%97%E7%AC%A6%E4%B8%B2%E6%96%B9%E6%B3%95%0A%60%60%60%0A*%20string.upper()%0A*%20string.lower()%0A*%20string.reverse()%0A*%20string.find()%0A*%20string.sub()%0A*%20string.rep()%20(%E5%AD%97%E7%AC%A6%E4%B8%B2%E9%87%8D%E5%A4%8D)%0A*%20string.gsub()%20(%E5%AD%97%E7%AC%A6%E4%B8%B2%E4%BF%AE%E6%94%B9)%0A*%20string.byte()%20(%E5%AD%97%E7%AC%A6%E8%BD%AC%20ASCII%E7%A0%81)%0A*%20string.char()%20(ASCII%E7%A0%81%E8%BD%AC%20%E5%AD%97%E7%AC%A6)%0A%60%60%60%0A%0A%23%23%20P5%20%E8%BF%90%E7%AE%97%E7%AC%A6%0A*%20%E7%AE%97%E6%9C%AF%E8%BF%90%E7%AE%97%E7%AC%A6%0A%60%2B%20-%20*%20%2F%20%25%20%5E(%E5%B9%82%E8%BF%90%E7%AE%97)%60%0A*%20%E6%9D%A1%E4%BB%B6%E8%BF%90%E7%AE%97%E7%AC%A6%0A%60%3E%20%3C%20%3E%3D%20%3C%3D%20%3D%3D%20~%3D%60%0A*%20%E9%80%BB%E8%BE%91%E8%BF%90%E7%AE%97%E7%AC%A6%0A%60%26%26%20%7C%7C%20!%60%20%E5%AF%B9%E5%BA%94%0A%60and%20or%20not%60%0A*%20%E4%BD%8D%E8%BF%90%E7%AE%97%E7%AC%A6%0Alua%E4%B8%8D%E6%94%AF%E6%8C%81%E4%BD%8D%E8%BF%90%E7%AE%97%E7%AC%A6%0A*%20%E4%B8%89%E7%9B%AE%E8%BF%90%E7%AE%97%E7%AC%A6%0Alua%E4%B8%8D%E6%94%AF%E6%8C%81%E4%B8%89%E7%9B%AE%E8%BF%90%E7%AE%97%E7%AC%A6%0A%0A%23%23%20P8%20%E5%87%BD%E6%95%B0%0A*%20%E5%8F%98%E9%95%BF%E5%8F%82%E6%95%B0%0A%60%60%60%0Afunction%20F7(%20...%20)%0A%20%20%20%20--%E7%94%A8%E4%B8%80%E4%B8%AA%E8%A1%A8%E5%AD%98%E8%B5%B7%E6%9D%A5%E5%86%8D%E4%BD%BF%E7%94%A8%E5%8F%98%E9%95%BF%E5%8F%82%E6%95%B0%0A%20%20%20%20arg%20%3D%20%7B%20...%20%7D%0A%20%20%20%20for%20i%20%3D%201%2C%23arg%20do%0A%20%20%20%20%20%20%20%20print(arg%5Bi%5D)%0A%20%20%20%20end%0Aend%0AF7(1%2C%22123%22%2Ctrue%2C4%2C5%2C6)%0A%60%60%60%0A*%20%E9%97%AD%E5%8C%85%0A%E5%87%BD%E6%95%B0%E8%BF%94%E5%9B%9E%E5%87%BD%E6%95%B0%0A%60%60%60%0Afunction%20f9(x)%0A%20%20%20%20return%20function(y)%0A%20%20%20%20%20%20%20%20return%20x%20%2B%20y%0A%20%20%20%20end%0Aend%0A%60%60%60%0A%0A%23%23%20P9%20table%E8%A1%A8%0A%60%23%E8%A1%A8%E7%9A%84%E5%9D%91%60%0A!%5B38838a091294b70ce3346b7a3cfa1afe.png%5D(en-resource%3A%2F%2Fdatabase%2F2149%3A1)%0A!%5B4d134aa0ea1510ded15a3921bf57674d.png%5D(en-resource%3A%2F%2Fdatabase%2F2151%3A1)%0A%0A%23%23%20P13%20table%E8%A1%A8%E7%9A%84%E5%85%AC%E5%85%B1%E6%93%8D%E4%BD%9C%0A!%5B4a3e7d180767eba4a4d918449af38a74.png%5D(en-resource%3A%2F%2Fdatabase%2F2153%3A1)%0A!%5B2afd34c9b37ae8a3de974923ae1af38b.png%5D(en-resource%3A%2F%2Fdatabase%2F2155%3A1)%0A%0A%23%23%20P14%20%E5%A4%9A%E8%84%9A%E6%9C%AC%E6%89%A7%E8%A1%8C%0A--%20%E8%BF%94%E5%9B%9E%E5%80%BC%E6%98%AFBoolean%20%E6%84%8F%E6%80%9D%E6%98%AF%E8%AF%A5%E8%84%9A%E6%9C%AC%E6%98%AF%E5%90%A6%E8%A2%AB%E6%89%A7%E8%A1%8C%0Apackage.loaded%5B%22test%22%5D%0A%0A--%20%E5%8D%B8%E8%BD%BD%E5%B7%B2%E7%BB%8F%E6%89%A7%E8%A1%8C%E8%BF%87%E7%9A%84%E8%84%9A%E6%9C%AC%0Apackage.loaded%5B%22test%22%5D%20%3D%20nil%0A%0A%23%23%20P16%20%E5%8D%8F%E5%90%8C%E7%A8%8B%E5%BA%8F%0Afunc%20%3D%20function()%0A%20%20%20%20print(123)%0Aend%0Aco%20%3D%20coroutine.create(func)%20%20%20%20%20(thread%E7%B1%BB%E5%9E%8B)%0Acoroutine.resume()%20--%E9%87%8D%E5%90%AF%E5%8D%8F%E7%A8%8B%0Acoroutine.yield()%20--%E6%8C%82%E8%B5%B7%E5%8D%8F%E7%A8%8B%0Acoroutine.status(%E5%8D%8F%E7%A8%8B%E5%AF%B9%E8%B1%A1)%20--%E8%8E%B7%E5%8F%96%E5%8D%8F%E7%A8%8B%E7%8A%B6%E6%80%81%0Adead%E3%80%81suspended%E3%80%81running%0Acoroutine.running()%20--%E8%8E%B7%E5%8F%96%E5%BD%93%E5%89%8D%E6%AD%A3%E5%9C%A8%E8%BF%90%E8%A1%8C%E7%9A%84%E5%8D%8F%E7%A8%8B%E7%9A%84%E7%BA%BF%E7%A8%8B%E5%8F%B7%0A%0Aco2%20%3D%20coroutine.wrap(func)%20%20%20%20%20(function%E7%B1%BB%E5%9E%8B)%0A%0A%23%23%20P16%20%E5%8D%8F%E5%90%8C%E7%A8%8B%E5%BA%8F%0A*%20%E5%85%83%E8%A1%A8%E6%A6%82%E5%BF%B5%0A%0A*%20%E7%89%B9%E5%AE%9A%E6%93%8D%E4%BD%9C-__tostring%EF%BC%88%E5%BD%93%E5%AD%90%E8%A1%A8%E8%A6%81%E8%A2%AB%E5%BD%93%E5%81%9A%E5%AD%97%E7%AC%A6%E4%B8%B2%E4%BD%BF%E7%94%A8%E6%97%B6%EF%BC%8C%E4%BC%9A%E9%BB%98%E8%AE%A4%E8%B0%83%E7%94%A8%E8%BF%99%E4%B8%AA%E5%85%83%E8%A1%A8%E4%B8%AD%E7%9A%84tostring%E6%96%B9%E6%B3%95%EF%BC%89%0A%0A*%20%E7%89%B9%E5%AE%9A%E6%93%8D%E4%BD%9C-__call%EF%BC%88%E5%BD%93%E5%AD%90%E8%A1%A8%E8%A2%AB%E5%BD%93%E5%81%9A%E4%B8%80%E4%B8%AA%E5%87%BD%E6%95%B0%E6%9D%A5%E4%BD%BF%E7%94%A8%E6%97%B6%EF%BC%8C%E4%BC%9A%E9%BB%98%E8%AE%A4%E8%B0%83%E7%94%A8__call%E4%B8%AD%E7%9A%84%E5%86%85%E5%AE%B9%EF%BC%89%EF%BC%88%E5%BD%93%E5%B8%8C%E6%9C%9B%E4%BC%A0%E5%8F%82%E6%95%B0%E6%97%B6%EF%BC%8C%E8%A6%81%E8%AE%B0%E4%BD%8F%E9%BB%98%E8%AE%A4%E7%AC%AC%E4%B8%80%E4%B8%AA%E5%8F%82%E6%95%B0%EF%BC%8C%E6%98%AF%E8%B0%83%E7%94%A8%E8%80%85%E8%87%AA%E5%B7%B1%EF%BC%89%0A%0A*%20%E8%BF%90%E7%AE%97%E7%AC%A6%E9%87%8D%E8%BD%BD-__add%EF%BC%88%E7%9B%B8%E5%BD%93%E4%BA%8E%E8%BF%90%E7%AE%97%E7%AC%A6%E9%87%8D%E8%BD%BD%EF%BC%8C%E5%BD%93%E5%AD%90%E8%A1%A8%E4%BD%BF%E7%94%A8%2B%E8%BF%90%E7%AE%97%E7%AC%A6%E6%97%B6%E4%BC%9A%E8%B0%83%E7%94%A8%E8%AF%A5%E6%96%B9%E6%B3%95%EF%BC%89%0A__sub%EF%BC%8C__mul%EF%BC%8C__div%EF%BC%8C__mod%EF%BC%8C__pow%EF%BC%88%2B%EF%BC%8C-%EF%BC%8C*%20%EF%BC%8C%2F%EF%BC%8C%25%EF%BC%89%0A__eq%EF%BC%8C__lt%EF%BC%8C__le%EF%BC%8C__concat%EF%BC%88%3D%3D%EF%BC%8C%3C%EF%BC%8C%3C%3D%EF%BC%8C..%20%EF%BC%89%0A(%E5%A6%82%E6%9E%9C%E8%A6%81%E7%94%A8%E6%9D%A1%E4%BB%B6%E8%BF%90%E7%AE%97%E7%AC%A6%E6%9D%A5%E6%AF%94%E8%BE%83%E4%B8%A4%E4%B8%AA%E5%AF%B9%E8%B1%A1%EF%BC%8C%E8%BF%99%E4%B8%A4%E4%B8%AA%E5%AF%B9%E8%B1%A1%E7%9A%84%E5%85%83%E8%A1%A8%E8%A6%81%E4%B8%80%E8%87%B4%E6%89%8D%E8%83%BD%E5%87%86%E7%A1%AE%E8%B0%83%E7%94%A8%E6%96%B9%E6%B3%95)%0A%0A*%20%E7%89%B9%E5%AE%9A%E6%93%8D%E4%BD%9C-__index%EF%BC%88%E5%BD%93%E5%AD%90%E8%A1%A8%E4%B8%AD%E6%89%BE%E4%B8%8D%E5%88%B0%E6%9F%90%E4%B8%80%E4%B8%AA%E5%B1%9E%E6%80%A7%E6%97%B6%E4%BC%9A%E5%88%B0%E5%85%83%E8%A1%A8%E4%B8%AD__index%E6%8C%87%E5%AE%9A%E7%9A%84%E8%A1%A8%E5%8E%BB%E6%89%BE%E7%B4%A2%E5%BC%95%EF%BC%89%EF%BC%88__index%E7%9A%84%E8%B5%8B%E5%80%BC%EF%BC%8C%E5%86%99%E5%9C%A8%E8%A1%A8%E5%A4%96%E9%9D%A2%E6%9D%A5%E5%88%9D%E5%A7%8B%E5%8C%96%EF%BC%89%0A__newindex%EF%BC%88%E5%BD%93%E8%B5%8B%E5%80%BC%E6%97%B6%EF%BC%8C%E5%A6%82%E6%9E%9C%E8%B5%8B%E5%80%BC%E4%B8%80%E4%B8%AA%E4%B8%8D%E5%AD%98%E5%9C%A8%E7%9A%84%E7%B4%A2%E5%BC%95%EF%BC%8C%E9%82%A3%E4%B9%88%E4%BC%9A%E6%8A%8A%E8%BF%99%E4%B8%AA%E5%80%BC%E8%B5%8B%E5%80%BC%E5%88%B0newindex%E6%89%80%E6%8C%87%E7%9A%84%E8%A1%A8%E4%B8%AD%EF%BC%8C%E4%B8%8D%E4%BC%9A%E4%BF%AE%E6%94%B9%E8%87%AA%E5%B7%B1%EF%BC%89%0A%0A*%20getnetatable%0A*%20rawget%EF%BC%88%E5%8F%AA%E5%9C%A8%E8%A1%A8%E5%86%85%E6%89%BE%E8%80%8C%E4%B8%8D%E5%8E%BB%E5%85%83%E8%A1%A8%E6%9F%A5%EF%BC%89%0A*%20rawset%0A%0A%23%23%20P17%20lua%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E4%B9%8B%E5%B0%81%E8%A3%85%0A%23%23%20P18%20lua%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E4%B9%8B%E7%BB%A7%E6%89%BF%0A%23%23%20P19%20lua%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E4%B9%8B%E5%A4%9A%E6%80%81%0A%23%23%20P22%20lua%E8%87%AA%E5%B8%A6%E5%BA%93%0Aos.time()%0Aos.date()%0A%0A***%0A%23%20%E5%87%BA%E7%8E%B0%E7%9A%84%E4%B8%80%E4%BA%9B%E9%97%AE%E9%A2%98%0A%5B%E5%88%9B%E5%BB%BA%E6%96%B0%E9%A1%B9%E7%9B%AE%E6%97%B6%E5%87%BA%E7%8E%B0%202%20%E4%B8%AA%E9%94%99%E8%AF%AF%5D(https%3A%2F%2Fforum.unity.com%2Fthreads%2Fgets-2-errors-while-creating-new-project.1198063%2F)%0A!%5B19dfba029b04859754ca32035ba0680f.png%5D(en-resource%3A%2F%2Fdatabase%2F2157%3A1)%0A*%20*%20*%0A**%E9%97%AE%E9%A2%98%E6%8F%8F%E8%BF%B0**%EF%BC%9A%0A%E5%AD%A6%E4%B9%A0%E3%80%90%E5%94%90%E8%80%81%E7%8B%AE%E3%80%91Unity%E7%83%AD%E6%9B%B4%E6%96%B0%E4%B9%8BAssetBundle%20P3%E6%97%B6%0A%E7%82%B9%E5%87%BB%E8%BF%90%E8%A1%8C%E5%9B%BE%E7%89%87%E6%B2%A1%E6%9C%89%E5%8A%A0%E8%BD%BD%E6%98%BE%E7%A4%BA%E5%87%BA%E6%9D%A5%0A**%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88**%EF%BC%9A%0A%E5%B0%86%E5%9B%BE%E7%89%87%E7%9A%84TextureType%E4%BF%AE%E6%94%B9%E4%B8%BA2d%2FUI%E6%A8%A1%E5%BC%8F%0A!%5B50a513c62f5ce995f0be075fe60e73b7.png%5D(en-resource%3A%2F%2Fdatabase%2F2159%3A1)%0A%0A
