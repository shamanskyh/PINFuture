//
//  PINResult.h
//  Pods
//
//  Created by Brandon Kase on 12/19/16.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PINResultSuccess<ObjectType>;
@class PINResultFailure<ObjectType>;

/**
 * A Result is value that has either succeeded or failed.
 */
@interface PINResult<ObjectType> : NSObject

+ (PINResultSuccess<ObjectType> *)withValue:(ObjectType)value;
+ (PINResultFailure<ObjectType> *)withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END

#import "PINResult2.h"
#import "PINResultSuccess.h"
#import "PINResultFailure.h"
