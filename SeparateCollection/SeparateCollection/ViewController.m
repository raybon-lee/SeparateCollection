//
//  ViewController.m
//  SeparateCollection
//
//  Created by okwei on 15/10/20.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "ViewController.h"
#import "LSYLineReveal.h"

@interface ViewController ()
{
    LSYLineReveal *reveal;
    LSYLineReveal *h_reveal;
}
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *h_view1;
@property (weak, nonatomic) IBOutlet UIView *h_view2;
@property (weak, nonatomic) IBOutlet UIView *h_view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    reveal = [[LSYLineReveal alloc] init];
    reveal.direction = LSYLineVertical; //设置分割线防线为垂直方向
    [reveal addAttributes:@{LSYLineColorAttributeName:[UIColor whiteColor],LSYLineLengthAttributeName:@180,LSYLineWidthAttributeName:@5}];  //设置分割线属性
    [reveal addLineWithViews:@[_view1,_view2,_view3]];  //设置要添加分割线的视图

    h_reveal = [[LSYLineReveal alloc] init];
    h_reveal.direction = LSYLineHorizontal;
    [h_reveal addAttributes:@{LSYLineColorAttributeName:[UIColor lightGrayColor],LSYLineLengthAttributeName:@0,LSYLineWidthAttributeName:@5}];
    [h_reveal addLineWithViews:@[_h_view1,_h_view2,_h_view3]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
