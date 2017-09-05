//
//  safeKeyBord.h
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^returnThingsBlock)();

@interface ISTSafeNumberKeybordView : UIView
@property (nonatomic,strong) returnThingsBlock returnBlock;
@end
