//
//  MochaAsyncTestTests.m
//  MochaAsyncTestTests
//
//  Created by azu on 08/29/2014.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import "MochaAsyncTest.h"

SPEC_BEGIN(InitialTests)

    describe(@"MochaAsynTest", ^{
        it(@"pass test", ^{
            [MochaAsyncTest runBlock:^(MochaAsyncDone done, MochaAsyncDoneWithError error) {
                // async function
                double delayInSeconds = 2.0;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_after(popTime, queue, ^(void) {
                    done();// => done async test
                });
            }];
        });
        it(@"fail test", ^{
            [MochaAsyncTest runBlock:^(MochaAsyncDone done, MochaAsyncDoneWithError error) {
                // async function
                double delayInSeconds = 2.0;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_after(popTime, queue, ^(void) {
                    // fail
                    error([[NSError alloc] initWithDomain:@"xxx" code:0 userInfo:@{}]);
                });
            }];
        });

    });

SPEC_END
