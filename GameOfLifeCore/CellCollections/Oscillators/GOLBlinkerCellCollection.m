//
//  GOLBlinkerCellCollection.m
//  GameOfLifeCore
//
//  Created by Will Grange on 12/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLBlinkerCellCollection.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"

@implementation GOLBlinkerCellCollection

- (instancetype)init
{
    return [self initWithCellsArray:[self positions]];
}

- (NSArray *)positions;
{
    return @[
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:30 Y:29]],
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:30 Y:30]],
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:30 Y:31]],
             ];
}

@end
