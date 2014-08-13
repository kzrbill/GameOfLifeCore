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
    GOLLocations *positionCollection = [[GOLLocations alloc] init];
    
    [positionCollection setLocationX:1 y:1 forCell:[self newCell]];
    [positionCollection setLocationX:1 y:1 forCell:[self newCell]];
    
    [positionCollection setLocationX:2 y:2 forCell:[self newCell]];
    [positionCollection setLocationX:2 y:2 forCell:[self newCell]];
    
    [positionCollection setLocationX:3 y:3 forCell:[self newCell]];
    
    // Act
    NSArray *positions = [positionCollection locations];
    
    // Assert
    XCTAssertEqual([positions count], 3, @"Position count should be 3");
}

- (GOLLivingCell *)newCell;
{
    return [[GOLLivingCell alloc] init];
}

@end
