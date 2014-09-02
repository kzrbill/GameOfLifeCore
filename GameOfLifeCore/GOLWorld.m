//
//  GOLWorld.m
//  GameOfLife
//
//  Created by Will Grange on 19/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLWorld.h"
#import "GOLPosition.h"
#import "GOLNeighborFinder.h"
#import "GOLLivingCell.h"
#import "GOLDeadCell.h"
#import "GOLCellType.h"

@interface GOLWorld ()

@property (nonatomic, strong, readwrite) GOLCellCollection *cellCollection;

@end

// A world evolves.
@implementation GOLWorld

- (BOOL)isEmpty
{
    return [self.cellCollection count] < 1;
}

- (void)seedWorldWithCells:(GOLCellCollection *)cellCollection;
{
    self.cellCollection = cellCollection;
}

- (GOLWorld *)evolve
{
    GOLCellCollection *evolvedCellCollection = [[GOLCellCollection alloc] init];
    
    for (NSString *key in self.cellCollection)
    {
        id<GOLCellType> cell = [self.cellCollection cellByKey:key];
        
        GOLNeighborFinder *neighborFinder = [[GOLNeighborFinder alloc] initWithLivingCellCollection:self.cellCollection centerPosition:cell.position];
        
        Byte livingNeighborCellCount = [[neighborFinder livingNeighbors] count];
        
        if ([cell shouldBeLiving:livingNeighborCellCount])
        {
            [evolvedCellCollection addCell:cell];
        }
        
        GOLCellCollection *deadCellCollection = [neighborFinder deadNeighbors];
        for (NSString *deadCellKey in deadCellCollection)
        {
            GOLDeadCell *deadCell = [deadCellCollection cellByKey:deadCellKey];
            
            GOLNeighborFinder *neighborFinder = [[GOLNeighborFinder alloc] initWithLivingCellCollection:self.cellCollection centerPosition:deadCell.position];
            
            Byte livingNeighborCellCount = [[neighborFinder livingNeighbors] count];
            if ([deadCell shouldBeLiving:livingNeighborCellCount])
            {
                [evolvedCellCollection addCell:[GOLLivingCell cellWithPosition:deadCell.position]];
            }
        }
    }
    
    return [self newWorldWithCellCollection:evolvedCellCollection];
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:self.class])
        return NO;
    
    GOLWorld *otherWorld = object;
    return [self.cellCollection isEqual:otherWorld.cellCollection];
}

- (NSUInteger)hash;
{
    return self.cellCollection.hash;
}


- (GOLWorld *)newWorldWithCellCollection:(GOLCellCollection *)cellCollection
{
    GOLWorld *world = [[GOLWorld alloc] init];
    [world seedWorldWithCells:cellCollection];
    return world;
}

@end
