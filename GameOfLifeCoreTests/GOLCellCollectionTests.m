//
//  GOLCellCollectionTests.m
//  GameOfLife
//
//  Created by Will Grange on 25/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLCellCollection.h"
#import "GOLPosition.h"
#import "GOLLivingCell.h"

@interface GOLCellCollectionTests : XCTestCase

@end

@implementation GOLCellCollectionTests

- (void)testCanCreateNewCellCollection
{
    // Arrange/Act
    GOLCellCollection *cellCollection = [[GOLCellCollection alloc] init];
    
    // Assert
    XCTAssertNotNil(cellCollection, @"Cell collection should not be nill");
}

- (void)testCanAddANewCellToTheCollection
{
    // Arrange
    GOLCellCollection *cellCollection = [[GOLCellCollection alloc] init];
    GOLLivingCell *expectedCell = [[GOLLivingCell alloc] initWithPosition:[[GOLPosition alloc] initWithX:3 Y:5]];
    
    // Act
    [cellCollection addCell:expectedCell];
    
    // Assert
    GOLLivingCell *actualCell = [cellCollection cellAtIndex:0];
    
    XCTAssertEqualObjects(expectedCell, actualCell, @"Expected cell did not equal actual cell");
}

- (void)testCountIsCorrectWhenAddedCellsAtDifferentPositions
{
    // Arrange
    GOLCellCollection *cellCollection = [[GOLCellCollection alloc] init];
    
    GOLLivingCell *expectedCell1 = [[GOLLivingCell alloc] initWithPosition:[[GOLPosition alloc] initWithX:1 Y:5]];
    GOLLivingCell *expectedCell2 = [[GOLLivingCell alloc] initWithPosition:[[GOLPosition alloc] initWithX:3 Y:5]];
    [cellCollection addCell:expectedCell1];
    [cellCollection addCell:expectedCell2];
    
    // Act
    NSUInteger count = [cellCollection count];
    
    // Assert
    XCTAssertEqual(count, 2, @"Expected cell count did not equal actual cell count");
}

@end
