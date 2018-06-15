#import "UINavigationController+customOperation.h"

@implementation UINavigationController (customOperation)

- (void)LBConstomPopToViewController:(NSString *)popViewControllerClassName animated:(BOOL)animated {
    NSMutableArray<UIViewController *> *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    
    __block UIViewController *popViewController;
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:NSClassFromString(popViewControllerClassName)]) {
            popViewController = obj;
            *stop = YES;
        }
    }];
    
    if (popViewController) {
        [self popToViewController:popViewController animated:animated];
    } else {
        [self popViewControllerAnimated:animated];
    }
}

- (void)LBConstomPopToViewController:(NSString *)popViewControllerClassName andPushToViewController:(UIViewController *)pushViewController animated:(BOOL)animated {
    
    NSMutableArray<UIViewController *> *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    NSMutableArray *newViewControllers = [NSMutableArray new];

    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [newViewControllers addObject:obj];
        if ([obj isMemberOfClass:NSClassFromString(popViewControllerClassName)]) {
            *stop = YES;
        }
    }];
    
    [newViewControllers addObject:pushViewController];
    [self setViewControllers:newViewControllers animated:animated];
}

- (void)LBConstomPopCount:(NSUInteger)popCount PushToViewController:(UIViewController *)pushViewController animated:(BOOL)animated {
    NSInteger viewCount = self.viewControllers.count;
    
    if (viewCount == 0) {
        return;
    }

    if (popCount > (viewCount - 1)) {
        [self setViewControllers:@[self.viewControllers.firstObject,pushViewController] animated:animated];
    } else {
        
        NSMutableArray<UIViewController *> *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
        [viewControllers removeObjectsInRange:NSMakeRange(viewControllers.count - popCount, popCount)];
        [viewControllers addObject:pushViewController];
        [self setViewControllers:viewControllers animated:animated];
    }
}

//控制器堆栈不会出现如此多的控制器
- (NSUInteger)LBNotFoundIndex {
    return 4404;
}


@end
