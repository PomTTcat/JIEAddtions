//
//  JEGlobal.m
//  cocoDemo
//
//  Created by JIE on 2018/6/16.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import "JEGlobal.h"

static const CGFloat _JE_iPhoneX_StatusBar_More_Height = 24.0;  //iphoneX 状态栏为44，其他版本状态栏为20.
static const CGFloat _JE_iPhoneX_Bottom_Height = 34;
static const CGFloat _JE_navgation_Height = 64.0;

@implementation JEGlobal

+ (CGRect)screenBounds {
    return [[UIScreen mainScreen] bounds];
}

+ (CGPoint)screenCenter {
    return CGPointMake(JEScreenWidth/2, JEScreenHeight/2);
}

+ (CGSize)screenSize {
    return [self screenSizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+ (CGSize)screenSizeInOrientation:(UIInterfaceOrientation)orientation {
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        size = CGSizeMake(size.height, size.width);
    }
    return size;
}

+ (CGFloat)navigationHeight {
    //iphoneX 状态栏为44，其他版本状态栏为20.
    if (JEisiPhoneX) {
        return _JE_navgation_Height + _JE_iPhoneX_StatusBar_More_Height;
    }
    return _JE_navgation_Height;
}

+ (CGFloat)iphoneXBottomHeight {
    if (JEisiPhoneX) {
        return _JE_iPhoneX_Bottom_Height;
    }
    return 0;
}

+ (CGFloat)iphoneX_StatusBar_More_Height {
    if (JEisiPhoneX) {
        return _JE_iPhoneX_StatusBar_More_Height;
    }
    return 0;
}

@end
