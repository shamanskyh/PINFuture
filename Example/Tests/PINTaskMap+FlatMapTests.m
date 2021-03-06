//
//  PINTaskMap+FlatMapTests.m
//  PINFuture
//
//  Created by Chris Danford on 12/14/16.
//  Copyright © 2016 Pinterest. All rights reserved.
//

#import "PINTask.h"
#import "TestUtil.h"

SpecBegin(PINTaskMapFlatMapSpecs)

describe(@"flatMap", ^{
    it(@"can return to a resolved value", ^{
        NSNumber *valueA = numberFixture();
        NSString *valueB = stringFixture();
        PINTask<NSNumber *> *taskA = [PINTask<NSNumber *> withValue:valueA];
        PINTask<NSString *> *taskB = [PINTaskMap<NSNumber *, NSString *> executor:[PINExecutor immediate] flatMap:taskA success:^PINTask<NSString *> * _Nonnull(NSNumber * _Nonnull fromValue) {
            return [PINTask<NSString *> withValue:valueB];
        }];
        runTaskAndExpectToFulfillWith(self, taskB, valueB);
    });
    
    it(@"can map to a rejected error", ^{
        NSString *valueA = stringFixture();
        NSError *errorB = errorFixture();
        PINTask<NSString *> *taskA = [PINTask<NSString *> withValue:valueA];
        PINTask<NSString *> *taskB = [PINTaskMap<NSString *, NSString *> executor:[PINExecutor immediate] flatMap:taskA success:^PINTask<NSString *> * _Nonnull(NSString * _Nonnull fromValue) {
            return [PINTask<NSString *> withError:errorB];
        }];
        runTaskAndExpectToRejectWith(self, taskB, errorB);
    });
});

SpecEnd
