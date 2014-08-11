//
//  NSArray+GOLPositionsToCellCollections.m
//  GameOfLife
//
//  Created by Will Grange on 06/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//


#import "NSArray+GOLPositionsToCellCollections.h"
#import "GOLDeadCell.h"
#import "GOLLivingCell.h"
#import "GOLCellCollection.h"

@implementation NSArray (GOLPositionsToCellCollections)

- (GOLCellCollection *)positionsToLivingCellCollection;
{
    GOLCellCollection *collection = [[GOLCellCollection alloc] init];
    for (GOLPosition *position in self) {
        [collection addCell:[[GOLLivingCell alloc] initWithPosition:position]];
    }
    return collection;
}

- (GOLCellCollection *)positionsToDeadCellCollection;
{
    GOLCellCollection *collection = [[GOLCellCollection alloc] init];
    for (GOLPosition *position in self) {
        [collection addCell:[[GOLDeadCell alloc] initWithPosition:position]];
    }
    return collection;
}

@end
