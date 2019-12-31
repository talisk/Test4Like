//
//  ViewController.m
//  Test4Like
//
//  Created by 孙恺 on 2019/12/31.
//  Copyright © 2019 Kuaishou. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"

@interface ViewController ()

@property (nonatomic, strong) TestModel *model;
//@property (nonatomic, strong) NSMutableDictionary *testObj;

@end

@implementation ViewController {
    NSMutableDictionary *_testObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _testObj = [[NSMutableDictionary alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.model = [[TestModel alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.model setBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf->_testObj removeAllObjects];
//        [strongSelf.testObj removeAllObjects];
    }];
}

@end
