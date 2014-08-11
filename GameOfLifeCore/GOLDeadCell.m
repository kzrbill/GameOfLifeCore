//
//  GOLDeadCell.m
//  GameOfLife
//
//  Created by Will Grange on 02/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLDeadCell.h"
#import "GOLPosition.h"

@implementation GOLDeadCell

- (id)initWithPosition:(GOLPosition *)postion;
{
    if (self = [super init])    
    {
        _position = postion;
    }
    return self;
}

+ (instancetype)cellWithPosition:(GOLPosition *)postion;
{
    return [[GOLDeadCell alloc] initWithPosition:postion];
}

- (BOOL)isEqual:(id)otherObject
{
    if (![otherObject isKindOfClass:self.class])
    {
        return NO;
    }
    
    GOLDeadCell *otherCell = otherObject;
    return [self.position isEqual:otherCell.position];
}

- (NSUInteger)hash;
{
    return [self.position hash];
}

- (BOOL)shouldBeLiving:(Byte)livingNeighborCellCount;
{
    return livingNeighborCellCount == 3;
}

@end
