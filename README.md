# SeparateCollection
BeeCloud杯开源代码项目--通用分割线库<br>
可以给不同的视图之间添加分割线，并且可以设置分割线的颜色，宽度与长度 

---
## 使用
* 导入项目中的`LSYLineReveal.h`与`LSYLineReveal.m`文件
* 实例化`LSYLineReveal`，并且实现下面的方法
``` objective-c
    reveal = [[LSYLineReveal alloc] init];
    reveal.direction = LSYLineVertical; //设置分割线防线为垂直方向
    [reveal addAttributes:@{LSYLineColorAttributeName:[UIColor whiteColor],LSYLineLengthAttributeName:@180,LSYLineWidthAttributeName:@5}];  //设置分割线属性
    [reveal addLineWithViews:@[_view1,_view2,_view3]];  //设置要添加分割线的视图
```
----

**注意**<br>
由于`LSYLineReveal`类里面用到了`CALayer`的代理方法，所以`LSYLineReveal`的实例变量必须为全局变量。具体实现请参考示例代码。

