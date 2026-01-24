# Lua 进阶

# Lua元方法

[【LUA进阶系列】LUA元方法](https://www.freesion.com/article/53911311674/)

# Lua闭包

[深入理解Lua的闭�](https://blog.csdn.net/sbddbfm/article/details/94424695)�

在运行时，每当Lua执行一个形如function…end 这样的表达式时，他就会创建一个新的数据对象，其中包含了相应函数原型的引用及一个由所有upvalue引用组成的数组，而这个数据对象就称为闭包。

upvalue实际指的是变量而不是值，这些变量可以在内部函数之间共享，即upvalue提供一种闭包之间共享数据的方法

# Lua实现类

# Lua GC

[lua的GC原理](https://blog.csdn.net/LJY_rookie/article/details/108141615)

%23%20Lua%E5%85%83%E6%96%B9%E6%B3%95%0A%5B%E3%80%90LUA%E8%BF%9B%E9%98%B6%E7%B3%BB%E5%88%97%E3%80%91LUA%E5%85%83%E6%96%B9%E6%B3%95%5D(https%3A%2F%2Fwww.freesion.com%2Farticle%2F53911311674%2F)%0A%0A%23%20Lua%E9%97%AD%E5%8C%85%0A%5B%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3Lua%E7%9A%84%E9%97%AD%E5%8C%85%5D(https%3A%2F%2Fblog.csdn.net%2Fsbddbfm%2Farticle%2Fdetails%2F94424695)%0A%E5%9C%A8%E8%BF%90%E8%A1%8C%E6%97%B6%EF%BC%8C%E6%AF%8F%E5%BD%93Lua%E6%89%A7%E8%A1%8C%E4%B8%80%E4%B8%AA%E5%BD%A2%E5%A6%82function%E2%80%A6end%20%E8%BF%99%E6%A0%B7%E7%9A%84%E8%A1%A8%E8%BE%BE%E5%BC%8F%E6%97%B6%EF%BC%8C%E4%BB%96%E5%B0%B1%E4%BC%9A%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E6%96%B0%E7%9A%84%E6%95%B0%E6%8D%AE%E5%AF%B9%E8%B1%A1%EF%BC%8C%E5%85%B6%E4%B8%AD%E5%8C%85%E5%90%AB%E4%BA%86%E7%9B%B8%E5%BA%94%E5%87%BD%E6%95%B0%E5%8E%9F%E5%9E%8B%E7%9A%84%E5%BC%95%E7%94%A8%E5%8F%8A%E4%B8%80%E4%B8%AA%E7%94%B1%E6%89%80%E6%9C%89upvalue%E5%BC%95%E7%94%A8%E7%BB%84%E6%88%90%E7%9A%84%E6%95%B0%E7%BB%84%EF%BC%8C%E8%80%8C%E8%BF%99%E4%B8%AA%E6%95%B0%E6%8D%AE%E5%AF%B9%E8%B1%A1%E5%B0%B1%E7%A7%B0%E4%B8%BA%E9%97%AD%E5%8C%85%E3%80%82%0Aupvalue%E5%AE%9E%E9%99%85%E6%8C%87%E7%9A%84%E6%98%AF%E5%8F%98%E9%87%8F%E8%80%8C%E4%B8%8D%E6%98%AF%E5%80%BC%EF%BC%8C%E8%BF%99%E4%BA%9B%E5%8F%98%E9%87%8F%E5%8F%AF%E4%BB%A5%E5%9C%A8%E5%86%85%E9%83%A8%E5%87%BD%E6%95%B0%E4%B9%8B%E9%97%B4%E5%85%B1%E4%BA%AB%EF%BC%8C%E5%8D%B3upvalue%E6%8F%90%E4%BE%9B%E4%B8%80%E7%A7%8D%E9%97%AD%E5%8C%85%E4%B9%8B%E9%97%B4%E5%85%B1%E4%BA%AB%E6%95%B0%E6%8D%AE%E7%9A%84%E6%96%B9%E6%B3%95%0A%0A%23%20Lua%E5%AE%9E%E7%8E%B0%E7%B1%BB%0A%0A%23%20Lua%20GC%0A%5Blua%E7%9A%84GC%E5%8E%9F%E7%90%86%5D(https%3A%2F%2Fblog.csdn.net%2FLJY_rookie%2Farticle%2Fdetails%2F108141615)
