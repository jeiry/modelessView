//
//  ModelessAlertView.m
//  womusic
//
//  Created by jc on 6/24/14.
//  Copyright (c) 2014 jeiry. All rights reserved.
//

#import "ModelessAlertView.h"
static ModelessAlertView *instance = nil;
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
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
-(CGSize)sizeWithContent:(NSString *)content font:(UIFont *)font size:(CGSize)size
{
    CGSize mySize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect contentFrame = [content boundingRectWithSize:size
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil];              //method for versions after ios7
    mySize = CGSizeMake(contentFrame.size.width, contentFrame.size.height);
    
    return mySize;
}
-(void)showAlert:(NSString*)string dict:(NSDictionary*)setting{
    
    int newHeight;

    newHeight = [self sizeWithContent:string font:[UIFont systemFontOfSize:14] size:CGSizeMake(200, 1000)].height + 15;

    float positionX = SCREEN_HEIGHT-100;
    if ([[setting objectForKey:@"positionX"]isEqualToString:@"top"]) {
        positionX = 100;
    }else if ([[setting objectForKey:@"positionX"]isEqualToString:@"center"]) {
        positionX = (SCREEN_HEIGHT-newHeight)/2;
    }
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-[[setting objectForKey:@"width"] floatValue]/2, positionX, [[setting objectForKey:@"width"] floatValue], newHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;

    UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[setting objectForKey:@"width"] floatValue], newHeight)];
    [blackView setBackgroundColor:[UIColor blackColor]];
    blackView.alpha = 0.7;
    blackView.layer.masksToBounds = YES;
    blackView.layer.cornerRadius = 5;
    [view addSubview:blackView];
    
    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, [[setting objectForKey:@"width"] floatValue]-10, newHeight)];
    label.text = string;
    label.textColor = [UIColor whiteColor];
    [label setBackgroundColor:[UIColor clearColor]];
    
    if ([[setting objectForKey:@"textAlignment"]isEqualToString:@"left"]) {
        [label setTextAlignment:NSTextAlignmentLeft];
    }else if ([[setting objectForKey:@"textAlignment"]isEqualToString:@"right"]) {
        [label setTextAlignment:NSTextAlignmentRight];
    }else{
        [label setTextAlignment:NSTextAlignmentCenter];
    }
    
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setLineBreakMode:NSLineBreakByCharWrapping];
    [label setNumberOfLines:0];
    [view addSubview:label];
    
    [self showModelessAlert:view delay:[[setting objectForKey:@"delay"] intValue]];
    view = nil;
    blackView = nil;
    label = nil;
}

//非模态框 代理
- (void)showModelessAlert:(UIView*)view delay:(int)delay
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    [window addSubview:self];
    
    
    [alertView removeFromSuperview];
    alertView = view;
    [window addSubview:alertView];
    [self performSelector:@selector(fadeOut:) withObject:view afterDelay:delay];
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
