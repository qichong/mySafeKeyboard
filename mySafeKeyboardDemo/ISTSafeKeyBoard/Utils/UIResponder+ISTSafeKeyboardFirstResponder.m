//
//  UIResponder+safeKeyBordFirstResponder.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "UIResponder+ISTSafeKeyboardFirstResponder.h"

static __weak id safe_currentFirstResponder;
@implementation UIResponder (ISTSafeKeyboardFirstResponder)
+ (id)safe_currentFirstResponder{
    safe_currentFirstResponder = nil;
    /*
     UIWindow keyWindow = [[UIApplication sharedApplication] keyWindow];
     UIView firstResponder = [keyWindow performSelector:@selector(firstResponder)];
     */
    //以上方法调用了私有api，审核会被拒绝， 用递归也可以找到第一响应者，但是有点呵呵
    
    // 通过将target设置为nil，让系统自动遍历响应链
    // 从而响应链当前第一响应者响应我们自定义的方法
    [[UIApplication sharedApplication] sendAction:@selector(safe_findFirstResponder:)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    return safe_currentFirstResponder;
}
- (void)safe_findFirstResponder:(id)sender {
    // 第一响应者会响应这个方法，并且将静态变量wty_currentFirstResponder设置为自己
    safe_currentFirstResponder = self;
}

@end
