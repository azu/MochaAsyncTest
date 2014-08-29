# MochaAsyncTest

[![CI Status](http://img.shields.io/travis/azu/MochaAsyncTest.svg?style=flat)](https://travis-ci.org/azu/MochaAsyncTest)
[![Version](https://img.shields.io/cocoapods/v/MochaAsyncTest.svg?style=flat)](http://cocoadocs.org/docsets/MochaAsyncTest)
[![License](https://img.shields.io/cocoapods/l/MochaAsyncTest.svg?style=flat)](http://cocoadocs.org/docsets/MochaAsyncTest)
[![Platform](https://img.shields.io/cocoapods/p/MochaAsyncTest.svg?style=flat)](http://cocoadocs.org/docsets/MochaAsyncTest)


## Installation

MochaAsyncTest is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "MochaAsyncTest"

## Usage

### done

When pass the test then call `done()`

### error

When fail the test then call `error(NSError *error)`

```objc
describe(@"MochaAsyncTest", ^{
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
```

## Requirements

- XCTest
- [ishkawa/NSRunLoop-PerformBlock](https://github.com/ishkawa/NSRunLoop-PerformBlock "ishkawa/NSRunLoop-PerformBlock")

## Author

azu, azuciao@gmail.com

## License

MochaAsyncTest is available under the MIT license. See the LICENSE file for more info.

