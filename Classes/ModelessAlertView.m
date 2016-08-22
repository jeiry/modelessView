//
//  ModelessAlertView.m
//  womusic
//
//  Created by jc on 6/24/14.
//  Copyright (c) 2014 jeiry. All rights reserved.
//

#import "ModelessAlertView.h"
static ModelessAlertView *instance = nil;

@implementation ModelessAlertView
+ (ModelessAlertView *)instance {
    if (!instance) {
        instance = [[super allocWithZone:NULL] init];
    }
    return instance;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [self instance];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
-(void)showAlert:(NSString*)string width:(int)width height:(int)height{
    
    int newHeight;

    newHeight = [Config sizeWithContent:string font:[UIFont systemFontOfSize:14] size:CGSizeMake(200, 1000)].height + 15;

    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-width/2, SCREEN_HEIGHT-100, width, newHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;

    UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, newHeight)];
    [blackView setBackgroundColor:[UIColor blackColor]];
    blackView.alpha = 0.7;
    blackView.layer.masksToBounds = YES;
    blackView.layer.cornerRadius = 5;
    [view addSubview:blackView];
    
    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, newHeight)];
    label.text = string;
    label.textColor = [UIColor whiteColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setLineBreakMode:NSLineBreakByCharWrapping];
    [label setNumberOfLines:0];
    [view addSubview:label];
    
    [self showModelessAlert:view];
    view = nil;
    blackView = nil;
    label = nil;
}

//非模态框 代理
- (void)showModelessAlert:(UIView*)view
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    [window addSubview:self];
    
    
    [alertView removeFromSuperview];
    alertView = view;
    [window addSubview:alertView];
    [self performSelector:@selector(fadeOut:) withObject:view afterDelay:3];
}
//淡出
-(void)fadeOut:(UIView*)view{
    [UIView animateWithDuration:1 animations:^{
        [view setAlpha:0];
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}
//立刻关闭
-(void)closeAlert{
    [UIView animateWithDuration:1 animations:^{
        [alertView setAlpha:0];
    } completion:^(BOOL finished) {
        [alertView removeFromSuperview];
    }];
}
@end
