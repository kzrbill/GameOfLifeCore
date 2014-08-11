//
//  GOLCell.m
//  GameOfLife
//
//  Created by Will Grange on 18/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLLivingCell.h"
#import "GOLPosition.h"

@implementation GOLLivingCell

- (instancetype)initWithPosition:(GOLPosition *)position;
{
    if (self = [super init])
    {
        _position = position;
    }
    return self;
}

+ (instancetype)cellWithPosition:(GOLPosition *)postion;
{
    return [[GOLLivingCell alloc] initWithPosition:postion];
}

- (BOOL)isEqual:(id)otherObject
{
    if (![otherObject isKindOfClass:self.class])
    {
        return NO;
    }
    
    GOLLivingCell *otherCell = otherObject;
    return [self.position isEqual:otherCell.position];
}

- (NSUInteger)hash;
{
    return [self.position hash];
}

- (BOOL)shouldBeLiving:(Byte)livingNeighborCellCount;
{
    return (livingNeighborCellCount > 1) && (livingNeighborCellCount < 4);
}

@end
