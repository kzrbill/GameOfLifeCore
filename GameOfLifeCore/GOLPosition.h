//
//  GOLPosition.h
//  GameOfLife
//
//  Created by Will Grange on 16/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOLPosition : NSObject

@property (nonatomic, assign, readonly) NSInteger x;
@property (nonatomic, assign, readonly) NSInteger y;

- (instancetype)initWithX:(NSInteger)x Y:(NSInteger)y;
+ (GOLPosition *)positionWithX:(NSInteger)x Y:(NSInteger)y;
- (NSArray *)neighbours;

@end
