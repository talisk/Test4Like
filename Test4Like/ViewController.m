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
    int _a;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"self指向：%p - self本身：%p", self, &self);
    __weak __typeof(self) weakSelf = self;
    NSLog(@"weakself指向：%p - weakSelf本身：%p", weakSelf, &weakSelf);
    TestView *test = [[TestView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    test.backgroundColor = [UIColor cyanColor];
    test.handler = ^(NSString *str) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"Block内部，weakSelf指向：%p - weakSelf本身：%p", weakSelf, &weakSelf);
        NSLog(@"strongSelf指向：%p - strongSelf本身：%p", strongSelf, &strongSelf);
        NSLog(@"%d", strongSelf->_a);
    };
    [self.view addSubview:test];

    //想办法让ViewController被释放掉
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = [[UIViewController alloc] init];
    });
}

@end
