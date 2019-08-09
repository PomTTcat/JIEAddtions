//
//  ViewController.m
//  cocoDemo
//
//  Created by JIE on 2018/6/15.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import "ViewController.h"
#import "JEBaseModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JEBaseModel *model = [JEBaseModel new];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Test Git %s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
