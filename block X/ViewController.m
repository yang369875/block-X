//
//  ViewController.m
//  block X
//
//  Created by sunfly on 2018/5/23.
//  Copyright © 2018年 sunfly. All rights reserved.
//

#import "ViewController.h"
#import "ViewBController.h"
#import "applyCell.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *applyArray;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self blockTest];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    [self.view addSubview:self.tableView];
    [self blockTestA];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"self.applyArray is %@",self.applyArray);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.applyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"applyCell";
    applyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.label = self.applyArray[indexPath.row];
    return cell;
}

- (void)blockTest
{
    int outA = 8;
    int (^myPtr)(int) = ^(int a)
    {
        return outA + a;
    };
    int result = myPtr(3);
    NSLog(@"result = %d", result);
}

- (void)blockTestA
{
    static int outA = 8;
    int (^myPtr)(int) = ^(int a)
    {
        outA = 4;
        return outA + a;
    };
    outA = 5;
    int result = myPtr(3);
    NSLog(@"resultA = %d", result);
}

- (IBAction)jumpToB:(id)sender
{
    UIStoryboard *main=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewBController *VCB=[main instantiateViewControllerWithIdentifier:@"ViewBController"];
    VCB.applyDetail = ^(NSMutableDictionary *dict)
    {
        [self.applyArray addObject:dict];
        [self.tableView reloadData];
    };
    [self showViewController:VCB sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
