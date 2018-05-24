//
//  ViewBController.h
//  block X
//
//  Created by sunfly on 2018/5/23.
//  Copyright © 2018年 sunfly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewBController : UIViewController

typedef void (^addApplyDetail)(NSMutableDictionary *dict);

@property (nonatomic, copy) addApplyDetail applyDetail;

@end
