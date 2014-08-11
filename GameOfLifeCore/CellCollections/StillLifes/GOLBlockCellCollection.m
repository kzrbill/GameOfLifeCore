//
//  GOLStillLife.m
//  GameOfLife
//
//  Created by Will Grange on 06/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLBlockCellCollection.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"

@implementation GOLBlockCellCollection

- (instancetype)init
{
    return [self initWithCellsArray:[self positions]];
}

- (NSArray *)positions;
{
    return @[
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:1 Y:1]],
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:2 Y:1]],
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:1 Y:2]],
             [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:2 Y:2]],
      ];
}

@end
