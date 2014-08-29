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

## Known problem

When use `error(NSError *error)` with Kiwi, fail test, but throw exception...

```
2014-08-29 15:52:25.523 MochaAsyncTest[21402:1003] Fail Error: Error Domain=xxx Code=0 "The operation couldn’t be completed. (xxx error 0.)"
2014-08-29 15:52:25.523 MochaAsyncTest[21402:1003] +[MochaAsyncTest recordFailureWithDescription:inFile:atLine:expected:]: unrecognized selector sent to class 0x9461b4c
2014-08-29 15:52:25.524 MochaAsyncTest[21402:1003] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '+[MochaAsyncTest recordFailureWithDescription:inFile:atLine:expected:]: unrecognized selector sent to class 0x9461b4c'
*** First throw call stack:
(
	0   CoreFoundation                      0x017f11e4 __exceptionPreprocess + 180
	1   libobjc.A.dylib                     0x015708e5 objc_exception_throw + 44
	2   CoreFoundation                      0x0188e0e3 +[NSObject(NSObject) doesNotRecognizeSelector:] + 275
	3   CoreFoundation                      0x017e150b ___forwarding___ + 1019
	4   CoreFoundation                      0x017e10ee _CF_forwarding_prep_0 + 14
	5   XCTest                              0x2010444a _XCTFailureHandler + 1050
	6   Tests                               0x0944272f __35+[MochaAsyncTest runBlock:timeout:]_block_invoke3 + 303
	7   Tests                               0x094021fb __34+[InitialTests buildExampleGroups]_block_invoke_314 + 235
	8   libdispatch.dylib                   0x0256e7b8 _dispatch_call_block_and_release + 15
	9   libdispatch.dylib                   0x025834d0 _dispatch_client_callout + 14
	10  libdispatch.dylib                   0x025709c6 _dispatch_after_timer_callback + 98
	11  libdispatch.dylib                   0x025834d0 _dispatch_client_callout + 14
	12  libdispatch.dylib                   0x02579e93 _dispatch_source_latch_and_call + 150
	13  libdispatch.dylib                   0x0257443f _dispatch_source_invoke + 415
	14  libdispatch.dylib                   0x02571de2 _dispatch_root_queue_drain + 78
	15  libdispatch.dylib                   0x02572127 _dispatch_worker_thread2 + 39
	16  libsystem_pthread.dylib             0x028b2dab _pthread_wqthread + 336
	17  libsystem_pthread.dylib             0x028b6cce start_wqthread + 30
)
libc++abi.dylib: terminating with uncaught exception of type NSException
```


## Requirements

- XCTest
- [ishkawa/NSRunLoop-PerformBlock](https://github.com/ishkawa/NSRunLoop-PerformBlock "ishkawa/NSRunLoop-PerformBlock")

## Author

azu, azuciao@gmail.com

## License

MochaAsyncTest is available under the MIT license. See the LICENSE file for more info.

