//
// Created by azu on 2014/08/29.
//


#import "MochaAsyncTest.h"
#import <XCTest/XCTest.h>
#import "NSRunLoop+PerformBlock.h"

@implementation MochaAsyncTest
+ (void)runBlock:(void (^)(MochaAsyncDone done, MochaAsyncDoneWithError error)) runTestBlock {
    [self runBlock:runTestBlock timeout:10];
}

+ (void)runBlock:(void (^)(MochaAsyncDone, MochaAsyncDoneWithError)) runTestBlock timeout:(NSTimeInterval) timeout {
    __block BOOL isTimeout = YES;
    [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
        runTestBlock(^{
            isTimeout = NO;
            *finish = YES;
        }, ^(NSError *error) {
            isTimeout = NO;
            *finish = YES;
            NSLog(@"Fail Error: %@", error);
            XCTFail(@"Done Error");
        });
    } timeoutInterval:timeout];
    if (isTimeout) {

        XCTFail(@"Timeout Error");
    }
}
@end