//
//  ViewController.m
//  modelessViewDemo
//
//  Created by jeiryC on 16/8/22.
//  Copyright © 2016年 jeiryC. All rights reserved.
//

#import "ViewController.h"
#import "ModelessAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)showAlertAction:(id)sender {
    [[ModelessAlertView instance]showAlert:@"Hello World Hello World Hello World Hello World Hello World Hello World Hello World" dict:@{@"width":@"300",
               @"textAlignment":@"center",//option
               @"delay":@"3",
               @"positionX":@"center",//option
               }
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
