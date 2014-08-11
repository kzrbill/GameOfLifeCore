//
//  GOLNeighborFinderTests.m
//  GameOfLife
//
//  Created by Will Grange on 31/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLNeighborFinder.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"
#import "GOLCellCollection.h"
#import "GOLBlockCellCollection.h"
#import "NSArray+GOLPositionsToCellCollections.h"

@interface GOLNeighborFinderTests : XCTestCase

@end

@implementation GOLNeighborFinderTests

- (void)testNumberOfNeighborsIsCorrectWhenSurrounded
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:2 Y:2] expectedNumberOfNeighbors:8];
}

- (void)testNumberOfNeighborsIsCorrectWhenTopLeftOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:0 Y:0] expectedNumberOfNeighbors:1];
}

- (void)testNumberOfNeighborsIsCorrectWhenTopMiddleOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:2 Y:0] expectedNumberOfNeighbors:3];
}

- (void)testNumberOfNeighborsIsCorrectWhenTopRightOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:4 Y:0] expectedNumberOfNeighbors:1];
}

- (void)testNumberOfNeighborsIsCorrectWhenMiddleLeftOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:0 Y:2] expectedNumberOfNeighbors:3];
}

- (void)testNumberOfNeighborsIsCorrectWhenBottomLeftOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:0 Y:4] expectedNumberOfNeighbors:1];
}

- (void)testNumberOfNeighborsIsCorrectWhenMiddleRightOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:4 Y:2] expectedNumberOfNeighbors:3];
}

- (void)testNumberOfNeighborsIsCorrectWhenBottomRightOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:4 Y:4] expectedNumberOfNeighbors:1];
}

- (void)testNumberOfNeighborsIsCorrectWhenBottomMiddleOfBlock
{
    [self testFinderWithPosition:[[GOLPosition alloc] initWithX:2 Y:4] expectedNumberOfNeighbors:3];
}

- (void)testDeadNeighborCellsAreEqualToExpectedCells
{
    // Arrange
    GOLCellCollection *cellCollection = [[self testLiveCellCrossPositionSurroundngX1Y1] positionsToLivingCellCollection];
    GOLPosition *fromPosition = [[GOLPosition alloc] initWithX:1 Y:1];
    GOLNeighborFinder *neighborFinder = [[GOLNeighborFinder alloc] initWithLivingCellCollection:cellCollection centerPosition:fromPosition];
    
    // Act
    GOLCellCollection *deadCellCollection = [neighborFinder deadNeighbors];
    GOLCellCollection *expectedDeadCellCollection = [[self testExpectedDeadCellCrossPositionsSurroundngX1Y1] positionsToDeadCellCollection];
    
    // Assert
    XCTAssertTrue([deadCellCollection isEqual:expectedDeadCellCollection], @"Dead neighbor cells were not as expected");
}

- (void)testDeadCellNeighborCountIs7WhenCheckingFromTopLeftOfBlockCells
{
    // Arrange
    GOLBlockCellCollection *blockCellCollection = [[GOLBlockCellCollection alloc] init];
    GOLPosition *fromPosition = [[GOLPosition alloc] initWithX:0 Y:0];
    GOLNeighborFinder *neighborFinder = [[GOLNeighborFinder alloc] initWithLivingCellCollection:blockCellCollection centerPosition:fromPosition];
    
    // Act
    GOLCellCollection *deadCellCollection = [neighborFinder deadNeighbors];
    
    // Assert
    XCTAssertEqual([deadCellCollection count], 7, @"Dead cells count was not 7");
}

- (void)testFinderWithPosition:(GOLPosition *)position expectedNumberOfNeighbors:(Byte)expectedNumberOfNeighbors;
{
    // Arrange
    NSArray *cellPositions = [self testCellPositionsSurroundngX2Y2];
    GOLCellCollection *cellCollection = [cellPositions positionsToLivingCellCollection];
    GOLNeighborFinder *neighborFinder = [[GOLNeighborFinder alloc] initWithLivingCellCollection:cellCollection centerPosition:position];
    
    // Act
    Byte numberOfNeighbours = [[neighborFinder livingNeighbors] count];
    
    // Assert
    XCTAssertEqual(numberOfNeighbours, expectedNumberOfNeighbors, @"Number of neighbors was incorrect");
}

- (NSArray *)testCellPositionsSurroundngX2Y2
{
    return @[
             [[GOLPosition alloc] initWithX:1 Y:1],
             [[GOLPosition alloc] initWithX:2 Y:1],
             [[GOLPosition alloc] initWithX:3 Y:1],
             [[GOLPosition alloc] initWithX:1 Y:2],
             [[GOLPosition alloc] initWithX:3 Y:2],
             [[GOLPosition alloc] initWithX:1 Y:3],
             [[GOLPosition alloc] initWithX:2 Y:3],
             [[GOLPosition alloc] initWithX:3 Y:3],
             ];
}

- (NSArray *)testLiveCellCrossPositionSurroundngX1Y1
{
    return @[
             [[GOLPosition alloc] initWithX:1 Y:0],
             [[GOLPosition alloc] initWithX:2 Y:1],
             [[GOLPosition alloc] initWithX:1 Y:2],
             [[GOLPosition alloc] initWithX:0 Y:1],
             ];
}

- (NSArray *)testExpectedDeadCellCrossPositionsSurroundngX1Y1
{
    return @[
             [[GOLPosition alloc] initWithX:0 Y:0],
             [[GOLPosition alloc] initWithX:2 Y:0],
             [[GOLPosition alloc] initWithX:2 Y:2],
             [[GOLPosition alloc] initWithX:0 Y:2],
             ];
}

@end
