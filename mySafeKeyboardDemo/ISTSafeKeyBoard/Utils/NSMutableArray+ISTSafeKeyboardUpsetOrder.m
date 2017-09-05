//
//  NSMutableArray+upsetOrder.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "NSMutableArray+ISTSafeKeyboardUpsetOrder.h"

@implementation NSMutableArray (ISTSafeKeyboardUpsetOrder)
- (NSMutableArray *)upsetOrderMutableArrary{
    NSMutableArray *arrary = [[NSMutableArray alloc] initWithArray:self];
   [arrary sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return (NSInteger)arc4random() % 3 - 1;
    }];
    return arrary;
}
@end


