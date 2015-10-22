# SeparateCollection
BeeCloud杯开源代码项目--通用分割线库<br>
可以给不同的视图之间添加分割线，并且可以设置分割线的颜色，宽度与长度 

---
## 使用
* 导入项目中的`LSYLineReveal.h`与`LSYLineReveal.m`文件
* 实例化`LSYLineReveal`，并且设置分割线下面的属性
``` objective-c
extern NSString *const LSYLineColorAttributeName;   //分割线的颜色属性 默认颜色为黑色
extern NSString *const LSYLineWidthAttributeName;   //分割线的宽度属性 默认宽度为2个单位
extern NSString *const LSYLineLengthAttributeName;  //分割线的长度 默认根据不同尺寸的视图自动适配

typedef NS_ENUM(NSUInteger,LSYLineDirection){
    LSYLineHorizontal,  //水平的分割线
    LSYLineVertical,    //垂直的分割线
};

@interface LSYLineReveal : NSObject

@property (nonatomic) LSYLineDirection direction;   //分割线的方向

- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs;    //设置分割线的属性

- (void)addLineWithViews:(NSArray<UIView *> *)views;    //要添加分割线的视图
@end
```
----

**注意**<br>
由于`LSYLineReveal`类里面用到了`CALayer`的代理方法，所以`LSYLineReveal`的实例变量必须为全局变量。具体实现请参考示例代码。

