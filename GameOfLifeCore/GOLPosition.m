//
//  GOLPosition.m
//  GameOfLife
//
//  Created by Will Grange on 16/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLPosition.h"

@implementation GOLPosition

- (instancetype)initWithX:(NSInteger)x Y:(NSInteger)y
{
    if (self = [super init])
    {
        _x = x;
        _y = y;
    }
    return self;
}

+ (GOLPosition *)positionWithX:(NSInteger)x Y:(NSInteger)y;
{
    return [[GOLPosition alloc] initWithX:x Y:y];
}

- (NSArray *)neighbours;
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Not implemented"
                                 userInfo:nil];
}

#pragma mark - Object equality boilerplate.

- (BOOL)isEqual:(GOLPosition *)positionObject
{
    return positionObject.x == self.x && positionObject.y == self.y;
}

- (NSUInteger)hash
{
    // TODO - have this occur only once per object instance
    
    // First digits
    // 10000000 to 99999999 ~ x part
    // 10000000 to 99999999 ~ y part
    // 1 to 2 ~ x sign part
    // 1 to 2 ~ x sign part
    
    // e.g. for example, x == -400, y == -400, hash is 100004001000040011
    
    // Not ideal but requires less crunching from now.

    const NSUInteger COORD_BASE_NO = 10000000;
    
    BOOL xIsPositive = self.x > -1;
    BOOL yIsPositive = self.y > -1;
    
    Byte xSignPart = 1 + xIsPositive;
    Byte ySignPart = 1 + yIsPositive;
    
    NSUInteger xPart = COORD_BASE_NO + abs(self.x);
    NSUInteger yPart = COORD_BASE_NO + abs(self.y);
    
    NSString *numberStr = [NSString stringWithFormat:@"%d%d%d%d", xPart, yPart, xSignPart, ySignPart];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numberStr];
    
    return [number unsignedIntegerValue];
}

@end
