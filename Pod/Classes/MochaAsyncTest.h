//
// Created by azu on 2014/08/29.
//


#import <Foundation/Foundation.h>


typedef void(^MochaAsyncDone)();

typedef void(^MochaAsyncDoneWithError)(NSError *error);

@interface MochaAsyncTest : NSObject
+ (void)runBlock:(void (^)(MochaAsyncDone done, MochaAsyncDoneWithError fail)) runTestBlock;

+ (void)runBlock:(void (^)(MochaAsyncDone, MochaAsyncDoneWithError)) runTestBlock timeout:(NSTimeInterval) timeout;
@end