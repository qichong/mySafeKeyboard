//
//  safeKeyBordButton.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "ISTSafeKeyboardButton.h"

@implementation ISTSafeKeyboardButton

- (instancetype)init{
    if (self = [super init]) {

    }
    return self;
}

- (void)addLable{
    _safeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    _safeLable.backgroundColor = [UIColor clearColor];
    //      self.safeLable.font = [UIFont systemFontOfSize:15];
    _safeLable.font = [UIFont fontWithName:@"Helvetica" size:18.f];
    _safeLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_safeLable];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    _safeLable.text = self.titleLabel.text;
    _safeLable.textColor = self.currentTitleColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
