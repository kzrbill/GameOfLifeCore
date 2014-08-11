//
//  GOLDeadCellTests.m
//  GameOfLife
//
//  Created by Will Grange on 07/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLDeadCell.h"
#import "GOLPosition.h"

@interface GOLDeadCellTests : XCTestCase

@end

@implementation GOLDeadCellTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellComesAliveWhenHas3LivingNeighbors
{
    // Arrange
    GOLDeadCell *cell = [[GOLDeadCell alloc] initWithPosition:[GOLPosition positionWithX:0 Y:0]];
    Byte numberOfLivingNeighbors = 3;
    
    // Act
    BOOL shouldBeLiving = [cell shouldBeLiving:numberOfLivingNeighbors];
    
    // Assert
    XCTAssertTrue(shouldBeLiving, @"Cell should be alive as number of neighbors was 3");
}

@end
