//
//  ISTSafeKeyboard.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "ISTSafeKeyboard.h"

@implementation ISTSafeKeyboard

- (instancetype)initWithType:(TypeOfISTSafeKeyboard)keyboardType{
    if (self = [super init]) {
        switch (keyboardType) {
            case TypeOfISTSafeKeyboard_number:
            {
                ISTSafeNumberKeybordView *numberView =[[ISTSafeNumberKeybordView alloc] init];
                self.returnBlock = numberView.returnBlock;
                self = (ISTSafeKeyboard *)numberView;   //消除黄点，一个不留
            }
                break;
            
            default:
                break;
        }
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
