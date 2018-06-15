//
//  JEBaseModel.h
//  KitDemo
//
//  Created by JIE on 2018/6/15.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JEActionBlock)(void);

@interface JEBaseModel : NSObject

@property (copy, nonatomic)     JEActionBlock   actionBlock;
@property (copy, nonatomic)     NSString        *modelName;

@end
