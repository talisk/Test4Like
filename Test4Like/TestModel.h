//
//  TestModel.h
//  Test4Like
//
//  Created by 孙恺 on 2019/12/31.
//  Copyright © 2019 Kuaishou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TestBlock)(void);

@interface TestModel : NSObject

@property (nonatomic, copy) TestBlock block;

@end

NS_ASSUME_NONNULL_END
