//
//  GOLPostionTests.m
//  GameOfLife
//
//  Created by Will Grange on 16/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLPosition.h"

@interface GOLPostionTests : XCTestCase

@end

@implementation GOLPostionTests

- (void)testTwoCreatedPositionsAreEqual
{
    id position1 = [[GOLPosition alloc] initWithX:400 Y:400];
    id position2 = [[GOLPosition alloc] initWithX:400 Y:400];
    
    XCTAssert([position1 isEqual:position2], @"Objects should be equal");
}

- (void)testTwoCreatedPositionsAreNotEqual
{
    id position1 = [[GOLPosition alloc] initWithX:400 Y:400];
    id position2 = [[GOLPosition alloc] initWithX:300 Y:300];
    
    XCTAssertFalse([position1 isEqual:position2], @"Objects are equal");
}

- (void)testTwoCreatedPositionHashsAreEqual
{
    GOLPosition *position1 = [[GOLPosition alloc] initWithX:400 Y:400];
    GOLPosition *position2 = [[GOLPosition alloc] initWithX:400 Y:400];
    
    XCTAssert(position1.hash == position2.hash, @"Hashs should be equal");
}

- (void)testTwoCreatedPositionHashsAreNotEqual
{
    GOLPosition *position1 = [[GOLPosition alloc] initWithX:400 Y:400];
    GOLPosition *position2 = [[GOLPosition alloc] initWithX:-400 Y:-400];
    
    XCTAssert(position1.hash != position2.hash, @"Hashs should not be equal");
}

- (void)testPositionHashShouldNotBeZero
{
    GOLPosition *position = [[GOLPosition alloc] initWithX:0 Y:0];
    XCTAssert(position.hash != 0, @"Hash should not be zero");
}

@end
