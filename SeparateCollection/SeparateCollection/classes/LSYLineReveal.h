//
//  LSYLineReveal.h
//  SeparateCollection
//
//  Created by okwei on 15/10/20.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
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
- (void)addLineWithViews:(NSArray<UIView *> *)views;
@end
