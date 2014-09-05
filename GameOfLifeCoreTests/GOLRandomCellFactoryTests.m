//
//  RandomCellFactoryClass.m
//  GameOfLifeCore
//
//  Created by Will Grange on 05/09/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GOLRandomCellCollectionFactory.h"
#import "GOLCellCollection.h"

@interface GOLRandomCellFactoryTests : XCTestCase

@end

@implementation GOLRandomCellFactoryTests

- (void)testCanCreateANewFactory
{
    GOLRandomCellCollectionFactory *factory = [[GOLRandomCellCollectionFactory alloc] init];
    
    XCTAssertNotNil(factory, @"Factory was nil");
}

- (void)testCanGenerateANewCellCollectionWhenRangesAreGiven
{
    GOLRandomCellCollectionFactory *factory =
    [[GOLRandomCellCollectionFactory alloc] initWithXRange:NSMakeRange(5, 10)
                                                    yRange:NSMakeRange(10, 20)
                                                countRange:NSMakeRange(20, 30)];
    
    GOLCellCollection *cellCollection = [factory generateCollection];
    
    XCTAssertTrue(cellCollection.count >= 20, @"Number of cells were not greater than or equal to 20");
}

@end
