//
//  GOLPositionCollectionTests.m
//  GameOfLifeCore
//
//  Created by Will Grange on 13/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLLocations.h"
#import "GOLLivingCell.h"

@interface GOLLocationsTests : XCTestCase

@property (nonatomic, strong) NSMutableArray *cellPositions;

@end

@implementation GOLLocationsTests


- (void)testCellPositionCountMatchesNumberOfUniquePositionsSet;
{
    // Arrange
    GOLLocations *locations = [[GOLLocations alloc] init];
    
    [locations setLocationX:1 y:1 forCell:[self newCell]];
    [locations setLocationX:1 y:1 forCell:[self newCell]];
    
    [locations setLocationX:2 y:2 forCell:[self newCell]];
    [locations setLocationX:2 y:2 forCell:[self newCell]];
    
    [locations setLocationX:3 y:3 forCell:[self newCell]];
    
    // Act
    NSArray *locationsArray = [locations locations];
    
    // Assert
    XCTAssertEqual([locationsArray count], 3, @"Position count should be 3");
}

- (GOLLivingCell *)newCell;
{
    return [[GOLLivingCell alloc] init];
}

@end
