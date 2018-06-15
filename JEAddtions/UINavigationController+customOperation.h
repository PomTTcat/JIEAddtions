#import <UIKit/UIKit.h>

@interface UINavigationController (customOperation)


/**
 如果navigation堆栈里有同名控制器，则pop到该控制器。如果没有，则简单pop。
 如果有多个控制类名相同，则pop到最前面的VC

 @param popViewControllerClassName popview类名
 */
- (void)LBConstomPopToViewController:(NSString *)popViewControllerClassName animated:(BOOL)animated;


/**
 先pop到popVC,然后push到pushViewController
 注：如果有多个控制类名相同，则pop到最前面的VC
 注：如果找不到该popVC，直接发生push
 
 @param animated push是否是动画
 */
- (void)LBConstomPopToViewController:(NSString *)popViewControllerClassName andPushToViewController:(UIViewController *)pushViewController animated:(BOOL)animated;


/**
 很多需求里，在push前，销毁指定数量控制。
 比较常见的是当前是webview，登录成功后需要pop自己，然后再push到指定控制。这个popCount非常明显是1。

 @param popCount    需要pop的控制器数量。
 如果控制器堆栈总数是4，传入值是5.只会pop到root，再push。
 */
- (void)LBConstomPopCount:(NSUInteger)popCount PushToViewController:(UIViewController *)pushViewController animated:(BOOL)animated;

@end
