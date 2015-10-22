//
//  LSYLineReveal.m
//  SeparateCollection
//
//  Created by okwei on 15/10/20.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "LSYLineReveal.h"

NSString *const LSYLineColorAttributeName = @"color";
NSString *const LSYLineWidthAttributeName = @"width";
NSString *const LSYLineLengthAttributeName = @"length";
@interface LSYLineReveal ()
@property (nonatomic,strong) UIColor *color;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat length;
@property (nonatomic,strong) CALayer *lineLayer;
@property (nonatomic,copy) NSArray<UIView *> *views;
@end
@implementation LSYLineReveal
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(UIColor *)color
{
    if (!_color) {
        _color = [UIColor blackColor];
    }
    return _color;
}
-(CGFloat)width
{
    if (!_width) {
        _width = 2.0f;
    }
    return _width;
}
-(CALayer *)lineLayer
{
    if (!_lineLayer) {
        _lineLayer = [CALayer layer];
        _lineLayer.delegate = self;
    }
    return _lineLayer;
}
- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs
{
    attrs[LSYLineColorAttributeName]?self.color = attrs[LSYLineColorAttributeName]:({});
    attrs[LSYLineWidthAttributeName]?self.width = [attrs[LSYLineWidthAttributeName] floatValue]:({});
    attrs[LSYLineLengthAttributeName]?self.length = [attrs[LSYLineLengthAttributeName] floatValue]:({});
    
}
- (void)addLineWithViews:(NSArray<UIView *> *)views
{
    _views = views;
    if (!views.count) {
        return;
    }
    else{
        UIView *superView = views.firstObject.superview;
        self.lineLayer.frame = CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height);
        [superView.layer addSublayer:self.lineLayer];
        [self.lineLayer setNeedsDisplay];
        
    }
    
    return;
    
    
}
#pragma mark - CALayerDelegate
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    typeof(self)weakSelf = self;
    UIGraphicsPushContext(ctx);
    [_views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        typeof(weakSelf)strongSelf = weakSelf;
        CGRect rect = obj.frame;
        UIView *superView = obj.superview;
        if (idx == _views.count -1) {
            UIGraphicsPopContext();
            return;
        }
        CGRect nextRect = _views[idx+1].frame;
        switch (strongSelf.direction) {
            case LSYLineHorizontal:
            {
                CGContextSetLineWidth(ctx, self.width);
                CGContextSetStrokeColorWithColor(ctx, strongSelf.color.CGColor);
                CGContextMoveToPoint(ctx,_length?(superView.frame.size.width-_length)/2:0, rect.origin.y+rect.size.height+self.width);
                CGContextAddLineToPoint(ctx, _length?(superView.frame.size.width+_length)/2:superView.frame.size.width, rect.origin.y+rect.size.height+self.width);
                if (nextRect.origin.y - rect.origin.y - rect.size.height<self.width*2) {
                    CGFloat padding = self.width*2 - (nextRect.origin.y - rect.origin.y - rect.size.height);
                    _views[idx+1].frame = CGRectMake(_views[idx+1].frame.origin.x, _views[idx+1].frame.origin.y+padding, _views[idx+1].frame.size.width, _views[idx+1].frame.size.height);
                }
                CGContextStrokePath(ctx);
            }
                break;
            case LSYLineVertical:
            {
                CGContextSetLineWidth(ctx, self.width);
                CGContextSetStrokeColorWithColor(ctx, strongSelf.color.CGColor);
                CGContextMoveToPoint(ctx, rect.origin.x+rect.size.width+self.width,_length?(superView.frame.size.height - _length)/2:0);
                CGContextAddLineToPoint(ctx, rect.origin.x+rect.size.width+self.width, _length?(superView.frame.size.height+_length)/2:superView.frame.size.height);
                if (nextRect.origin.x - rect.origin.x - rect.size.width<self.width*2) {
                    CGFloat padding = self.width*2 - (nextRect.origin.x - rect.origin.x - rect.size.width);
                    _views[idx+1].frame = CGRectMake(_views[idx+1].frame.origin.x+padding, _views[idx+1].frame.origin.y, _views[idx+1].frame.size.width, _views[idx+1].frame.size.height);
                }
                CGContextStrokePath(ctx);
            }
                break;
            default:
                break;
        }
        UIGraphicsPopContext();
    }];
}

@end
