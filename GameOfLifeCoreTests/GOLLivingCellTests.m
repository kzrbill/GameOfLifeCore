//
//  GOLCellTests.m
//  GameOfLife
//
//  Created by Will Grange on 16/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLPosition.h"
#import "GOLLivingCell.h"

@interface GOLLivingCellTests : XCTestCase

@end

@implementation GOLLivingCellTests

- (void)testCellGetsCreatedWithPositionApplied
{
    GOLPosition *position = [[GOLPosition alloc] initWithX:100 Y:200];
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:position];
    
    XCTAssertEqualObjects(position, cell.position, @"Postion supplied should be set as the property of the cell");
}

// 1. If a living cell has less that two living neighbors, it is dead in the next generation, as if by underpopulation.

- (void)testCellDiesWhenLessThan2LivingNeighbors
{
    // Arrange
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:0 Y:0]];
    Byte numberOfLivingNeighbors = 1;
    
    // Act
    BOOL shouldBeLiving = [cell shouldBeLiving:numberOfLivingNeighbors];
    
    // Assert
    XCTAssertFalse(shouldBeLiving, @"Cell should be dead as number of neighbors was less than 2");
}

// 2. If a living cell has two or three living neighbors, it stays alive in the next generation.

- (void)testCellStaysAliveWhenHas2LivingNeighbors
{
    // Arrange
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:0 Y:0]];
    Byte numberOfLivingNeighbors = 2;
    
    // Act
    BOOL shouldBeLiving = [cell shouldBeLiving:numberOfLivingNeighbors];
    
    // Assert
    XCTAssertTrue(shouldBeLiving, @"Cell should be alive as number of neighbors was 2");
}

- (void)testCellStaysAliveWhenHas3LivingNeighbors
{
    // Arrange
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:0 Y:0]];
    Byte numberOfLivingNeighbors = 3;
    
    // Act
    BOOL shouldBeLiving = [cell shouldBeLiving:numberOfLivingNeighbors];
    
    // Assert
    XCTAssertTrue(shouldBeLiving, @"Cell should be alive as number of neighbors was 3");
}

// 3. If a living cell has more than three living neighbors, it is dead in the next generation, as if by overcrowding.

- (void)testCellDiesWhenGreaterThan3LivingNeighbors
{
    // Arrange
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:[GOLPosition positionWithX:0 Y:0]];
    Byte numberOfLivingNeighbors = 4;
    
    // Act
    BOOL shouldBeLiving = [cell shouldBeLiving:numberOfLivingNeighbors];
    
    // Assert
    XCTAssertFalse(shouldBeLiving, @"Cell should be dead as number of neighbors is 3");
}

@end
