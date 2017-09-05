//
//  ViewController.m
//  mySafeKeyboardDemo
//
//  Created by qichong on 2017/9/5.
//  Copyright © 2017年 qichong. All rights reserved.
//

#import "ViewController.h"
#import "ISTSafeKeyboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ISTSafeKeyboard *keybord = [[ISTSafeKeyboard alloc] initWithType:TypeOfISTSafeKeyboard_number];
    UITextField *feild = [[UITextField alloc] init];
    feild.frame = CGRectMake(100, 100, 500, 50);
    feild.layer.borderWidth = 2;
    feild.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:feild];
    feild.inputView = keybord;
    keybord.returnBlock = ^{
        
        NSLog(@"return");
    };

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
