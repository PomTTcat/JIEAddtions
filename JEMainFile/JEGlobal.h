//
//  JEGlobal.h
//  cocoDemo
//
//  Created by JIE on 2018/6/16.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define JESYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define JESYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define JESYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define JESYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define JESYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define JEisiPhone4 ([[UIScreen mainScreen] bounds].size.height == 480 || [[UIScreen mainScreen] bounds].size.width == 480) ? TRUE:FALSE
#define JEisiPhone5 ([[UIScreen mainScreen] bounds].size.height == 568 || [[UIScreen mainScreen] bounds].size.width == 568) ? TRUE:FALSE
#define JEisiPhone6 ([[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.width == 667) ? TRUE:FALSE
#define JEisiPhonePlus ([[UIScreen mainScreen] bounds].size.height == 736 || [[UIScreen mainScreen] bounds].size.width == 736) ? TRUE:FALSE
#define JEisiPhoneX ([[UIScreen mainScreen] bounds].size.height == 812 || [[UIScreen mainScreen] bounds].size.width == 812) ? TRUE:FALSE

#define JEScreenWidth [[UIScreen mainScreen] bounds].size.width
#define JEScreenHeight [[UIScreen mainScreen] bounds].size.height

#define JEWidthRatio (JEScreenWidth / 375.0)
#define JEHeightRatio (JEScreenHeight / 667.0)

#define JEAutoAdjustWidth(width) (ceilf((width) * JEWidthRatio))
#define JEAutoAdjustHeight(height) (ceilf((height) * JEHeightRatio))

#define JEPtFontSize(x)                          [UIFont systemFontOfSize:(x)]
#define JEPtBoldFontSize(x)                      [UIFont boldSystemFontOfSize:(x)];

@interface JEGlobal : NSObject

+ (CGRect)screenBounds;
+ (CGPoint)screenCenter;
+ (CGFloat)navigationHeight;
+ (CGFloat)iphoneXBottomHeight;             //iPhoneX 底部多出来的高.如果不是iPhoneX,则为0.
+ (CGFloat)iphoneX_StatusBar_More_Height;   // iPhoneX:24 or 0

@end


