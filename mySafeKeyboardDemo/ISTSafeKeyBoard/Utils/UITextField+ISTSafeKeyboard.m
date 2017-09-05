//
//  UITextField+safeKeyboard.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "UITextField+ISTSafeKeyboard.h"

@implementation UITextField (ISTSafeKeyboard)
- (void)changetext:(NSString *)text {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *start = self.selectedTextRange.start;
    UITextPosition *end = self.selectedTextRange.end;
    NSInteger startIndex = [self offsetFromPosition:beginning toPosition:start];
    NSInteger endIndex = [self offsetFromPosition:beginning toPosition:end];
    
    // 将输入框中的文字分成两部分，生成新字符串，判断新字符串是否满足要求
    NSString *originText = self.text;
    NSString *part1 = [originText substringToIndex:startIndex];
    NSString *part2 = [originText substringFromIndex:endIndex];
    
    NSInteger offset;
    
    if (![text isEqualToString:@"delete"]) {
        offset = text.length;
    } else {
        if (startIndex == endIndex) { // 只删除一个字符
            if (startIndex == 0) {
                return;
            }
            offset = -1;
            part1 = [part1 substringToIndex:(part1.length - 1)];
            text = @"";
        } else {
            offset = 0;
        }
    }
    
    NSString *newText = [NSString stringWithFormat:@"%@%@%@", part1, text, part2];
    self.text = newText;
    
    // 重置光标位置
    UITextPosition *now = [self positionFromPosition:start offset:offset];
    UITextRange *range = [self textRangeFromPosition:now toPosition:now];
    self.selectedTextRange = range;
}

@end
