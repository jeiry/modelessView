//
//  ModelessAlertView.h
//  womusic
//
//  Created by jc on 6/24/14.
//  Copyright (c) 2014 jeiry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"


@interface ModelessAlertView : NSObject{
    UIView * alertView;
}
+ (ModelessAlertView *)instance;
-(void)showAlert:(NSString*)string dict:(NSDictionary*)setting;
-(void)closeAlert;
@end
