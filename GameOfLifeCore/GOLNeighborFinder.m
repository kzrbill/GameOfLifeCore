//
//  GOLNeighborFinder.m
//  GameOfLife
//
//  Created by Will Grange on 30/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLNeighborFinder.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"
#import "GOLCellCollection.h"
#import "GOLLivingCell.h"
#import "GOLDeadCell.h"

@interface GOLNeighborFinder ()

// Constuctor properties
@property (nonatomic, strong) GOLCellCollection *worldCellCollection;
@property (nonatomic, strong) GOLPosition *centerPosition;

// Internals
@property (nonatomic, strong) GOLCellCollection *livingCellNeighbors;
@property (nonatomic, strong) GOLCellCollection *deadCellNeighbors;
@property (nonatomic, strong) NSArray *livingCellSearchPredicates;
@property (nonatomic, strong) NSArray *neighborPositions;

@end

@implementation GOLNeighborFinder

#pragma mark - Public

- (instancetype)initWithLivingCellCollection:(GOLCellCollection *)cellCollection centerPosition:(GOLPosition *)centerPosition;
{
    self = [super init];
    if (self) {
        _worldCellCollection = cellCollection;
        _centerPosition = centerPosition;
    }
    return self;
}

- (GOLCellCollection *)livingNeighbors
{
    return self.livingCellNeighbors;
}

- (GOLCellCollection *)deadNeighbors
{
    return self.deadCellNeighbors;
}

#pragma mark - Properties

- (GOLCellCollection *)livingCellNeighbors;
{
    if (_livingCellNeighbors)
        return _livingCellNeighbors;
    
    _livingCellNeighbors = [[GOLCellCollection alloc] init];
    
    for (GOLPosition *neighborPosition in self.neighborPositions)
    {
        bool hasCellAtLocation = [self.worldCellCollection cellAtX:neighborPosition.x y:neighborPosition.y] != nil;
        if (!hasCellAtLocation)
            continue;
        
        GOLLivingCell *livingCell = [[GOLLivingCell alloc] initWithPosition:neighborPosition];
        [_livingCellNeighbors addCell:livingCell];
    }
    
    return _livingCellNeighbors;
}

- (GOLCellCollection *)deadCellNeighbors;
{
    if (_deadCellNeighbors)
        return _deadCellNeighbors;
    
    _deadCellNeighbors = [[GOLCellCollection alloc] init];
    
    for (GOLPosition *neighborPosition in self.neighborPositions)
    {
        bool hasCellAtLocation = [self.worldCellCollection cellAtX:neighborPosition.x y:neighborPosition.y] != nil;
        if (hasCellAtLocation)
            continue;
        
        GOLDeadCell *deadCell = [[GOLDeadCell alloc] initWithPosition:neighborPosition];
        [_deadCellNeighbors addCell:deadCell];
    }
    
    return _deadCellNeighbors;
    
}

- (NSArray *)neighborPositions;
{
    if (_neighborPositions)
        return _neighborPositions;
    
    // Note: positions are clockwise starting from top left.
    _neighborPositions = @[
                           [GOLPosition positionWithX:self.centerPosition.x - 1 Y:self.centerPosition.y - 1],
                           [GOLPosition positionWithX:self.centerPosition.x     Y:self.centerPosition.y - 1],
                           [GOLPosition positionWithX:self.centerPosition.x + 1 Y:self.centerPosition.y - 1],
                           [GOLPosition positionWithX:self.centerPosition.x + 1 Y:self.centerPosition.y],
                           [GOLPosition positionWithX:self.centerPosition.x + 1 Y:self.centerPosition.y + 1],
                           [GOLPosition positionWithX:self.centerPosition.x     Y:self.centerPosition.y + 1],
                           [GOLPosition positionWithX:self.centerPosition.x - 1 Y:self.centerPosition.y + 1],
                           [GOLPosition positionWithX:self.centerPosition.x - 1 Y:self.centerPosition.y],
                           ];
    
    return _neighborPositions;
}

@end
