//
//  safeKeyBord.m
//  自定义键盘
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "ISTSafeNumberKeybordView.h"
#import "NSMutableArray+ISTSafeKeyboardUpsetOrder.h"
#import "UIResponder+ISTSafeKeyboardFirstResponder.h"
#import "UITextField+ISTSafeKeyboard.h"
#import "ISTSafeKeyboardButton.h"

static NSInteger safeBaseBtnTag = 999;
@interface ISTSafeNumberKeybordView()
@property (nonatomic,strong) NSMutableArray *firsthandArrary;
@end



@implementation ISTSafeNumberKeybordView

- (instancetype)init{
    if (self = [super init]) {
        _firsthandArrary = [[NSMutableArray alloc] initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
        [self createView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)createView{
  
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    //两个特殊按钮从数组中排除出去
    NSMutableArray *arrary = [_firsthandArrary upsetOrderMutableArrary];
    //在 索引为9前和最后一个加上两个
    [arrary insertObject:@"delete" atIndex:9];
    [arrary addObject:@"enter"];
    
    UIColor *btnTitleColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:1];
    UIColor *backColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    CGFloat gap = 10.0;
    
    CGFloat itemWidth = (CGRectGetWidth(window.frame) - 4 * gap ) / 3.0;
    CGFloat itemHeight = itemWidth / 2.0;
    CGFloat topBtnHeight = itemHeight * 0.7;//设计稿上量的大约是高度的0.7倍

    
    self.frame = CGRectMake(0, 0, CGRectGetWidth(window.frame), topBtnHeight + (gap +itemHeight) * 4);
    self.backgroundColor = backColor;
    
    UIButton *topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topBtn.backgroundColor = backColor;
    topBtn.frame = CGRectMake(0, 0, CGRectGetWidth(window.frame), topBtnHeight);
    [topBtn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-xialaImage"] forState:UIControlStateNormal];
    [topBtn addTarget:self action:@selector(registMyResponder:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:topBtn];
    
    CGFloat maxYForTopBtn = CGRectGetMaxY(topBtn.frame);
    for (NSInteger i = 0; i < 12; i++) {
        
        ISTSafeKeyboardButton *btn = [ISTSafeKeyboardButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(gap + (i % 3) * (itemWidth + gap),maxYForTopBtn + (i / 3) * (itemHeight + gap), itemWidth, itemHeight);
        [self addSubview:btn];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        //固定左右两个按钮
        if (i == 9) {
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-deleteImage"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-deleteImage"] forState:UIControlStateHighlighted];
            [btn setTitle:arrary[i] forState:UIControlStateNormal];
            
        }else if (i == 11){
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-enterImage"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-enterImage"] forState:UIControlStateHighlighted];
            [btn setTitle:arrary[i] forState:UIControlStateNormal];
        }
        else{
            btn.tag = safeBaseBtnTag + i;
            if (i == 10) {
                //为了是底部中间的那个按钮的tag值为正常的
                btn.tag = safeBaseBtnTag + i - 1;
            }
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-smallBackImage"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"ISTSafeKeyboard-smallBackImage"] forState:UIControlStateHighlighted];
            NSString *title = arrary[i];
            [btn addLable];
            [btn setTitleColor:btnTitleColor forState:UIControlStateNormal];
            [btn setTitle:title forState:UIControlStateNormal];
        }
//        btn.clipsToBounds = YES;
    }
}

- (void)remixArray{
    NSMutableArray *newArrary = [_firsthandArrary upsetOrderMutableArrary];
    for (NSInteger i = 0; i < newArrary.count ; i++) {
        ISTSafeKeyboardButton *btn = [self viewWithTag:i + safeBaseBtnTag];
        [btn setTitle:newArrary[i] forState:UIControlStateNormal];
    }
}

#pragma mark - btn Press
- (void)registMyResponder:(UIButton *)sender{
    UITextField *textFeild = [UIResponder safe_currentFirstResponder];
    if (![textFeild isKindOfClass:[UITextField class]] && ![textFeild isKindOfClass:[UITextView class]]) {
        return;
    }
    [textFeild resignFirstResponder];
}

- (void)pressBtn:(UIButton *)sender{
  UITextField *textFeild = [UIResponder safe_currentFirstResponder];
    if (![textFeild isKindOfClass:[UITextField class]] && ![textFeild isKindOfClass:[UITextView class]]) {
        return;
    }
    if ([sender.titleLabel.text isEqualToString:@"enter"]) {
        [textFeild resignFirstResponder];
        if (self.returnBlock) {
            self.returnBlock();
        }
        return;
    }
    [textFeild changetext:sender.titleLabel.text];
}

#pragma mark - notification willshow
- (void)KeyboardWillShowNotification:(NSNotification *)notification{
    [self remixArray];
}

#pragma mark - dealloc
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
