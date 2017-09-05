//
//  ISTSafeKeyboard.h
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISTSafeNumberKeybordView.h"
typedef NS_ENUM(NSInteger, TypeOfISTSafeKeyboard)
{
    TypeOfISTSafeKeyboard_number,
    //之后有需求再加
};

@interface ISTSafeKeyboard : UIView
- (instancetype)initWithType:(TypeOfISTSafeKeyboard)keyboardType;
@property (nonatomic,strong) returnThingsBlock returnBlock;
@end
