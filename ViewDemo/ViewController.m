//
//  ViewController.m
//  ViewDemo
//
//  Created by sycf_ios on 2017/3/16.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"
#define kScreenWidth self.view.bounds.size.width
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController{
    UITextView *messageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIToolbar *toolBar = [[UIToolbar alloc]init];
    [toolBar sizeToFit];
    toolBar.frame = CGRectMake(0, 0, kScreenWidth, 80);
    //输入框
    messageView = [[UITextView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth/4*3, 70)];
    messageView.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *textViewBtn = [[UIBarButtonItem alloc]initWithCustomView:messageView];
    //补充空白空间
    UIBarButtonItem *spaceBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //发送按钮
    UIButton *doneBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 50, 70)];
    [doneBtn setTitle:@"发送" forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithCustomView:doneBtn];
    //添加进toolBar
    [toolBar setItems:@[textViewBtn,spaceBtn,done]];
    //设置textView的inputAccessoryView
    
    self.textView.inputAccessoryView = toolBar;
    
}
-(void)doneAction:(UIButton *)item{
    NSLog(@"message:%@",messageView.text);
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
