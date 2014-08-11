//
//  GOLWorldTests.m
//  GameOfLife
//
//  Created by Will Grange on 19/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLWorld.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"

@interface GOLWorldTests : XCTestCase

@end

@implementation GOLWorldTests

- (void)testNewWorldIsEmpty
{
    GOLWorld *world = [[GOLWorld alloc] init];
    XCTAssert([world isEmpty], @"New world was not empty.");
}

- (void)testCanSeedANewWorldWithCellCollection
{
    // Arrange
    GOLWorld *world = [[GOLWorld alloc] init];
    
    // Act
    [world seedWorldWithCells:[self testCellCollection]];
    
    // Assert
    XCTAssertFalse([world isEmpty], @"World was empty.");
}

- (void)testEvolveCreatesAnotherWorld
{
    // Arrange
    GOLWorld *world = [[GOLWorld alloc] init];
    
    // Act
    GOLWorld *anotherWorld = [world evolve];
    
    // Assert
    XCTAssertNotNil(anotherWorld, @"New world was nil.");
}

- (void)testEvolveCreatesAnotherDifferentWorld
{
    // Arrange
    GOLWorld *world = [[GOLWorld alloc] init];
    [world seedWorldWithCells:[self testCellCollection]];
    
    // Act
    GOLWorld *anotherWorld = [world evolve];
    
    // Assert
    XCTAssertFalse([anotherWorld isEqual:world], @"Worlds were equal. They should have evolved.");
}

- (GOLCellCollection *)testCellCollection
{
    GOLCellCollection *cellCollection = [[GOLCellCollection alloc] init];
    GOLLivingCell *cell = [[GOLLivingCell alloc] initWithPosition:[[GOLPosition alloc] initWithX:3 Y:5]];
    [cellCollection addCell:cell];
    return cellCollection;
}

@end
