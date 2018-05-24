//
//  ViewBController.m
//  block X
//
//  Created by sunfly on 2018/5/23.
//  Copyright © 2018年 sunfly. All rights reserved.
//

#import "ViewBController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewBController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *txtField;
@property (strong, nonatomic) NSMutableDictionary *textDict;

@end

@implementation ViewBController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtField = [[UITextField alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/4, SCREEN_WIDTH/2, 20)];
    [self.view addSubview:self.txtField];
    [self.txtField resignFirstResponder];
}

#pragma mark-->键盘隐藏
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"self.textDict----> is %@",self.textDict);
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSString *text = textField.text;
    NSString *textIndexPath = [NSString stringWithFormat:@"%ld", (long)textField.tag];
    [self.textDict setObject:text forKey:textIndexPath];
    NSLog(@"text is %@ \nself.textDict is %@\ntextinfdexpath is %@",text, self.textDict,textIndexPath);
}

- (IBAction)jumpToA:(id)sender
{
    NSLog(@"self.textDict is %@",self.textDict);
    [self.view resignFirstResponder];
    self.applyDetail(self.textDict);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
