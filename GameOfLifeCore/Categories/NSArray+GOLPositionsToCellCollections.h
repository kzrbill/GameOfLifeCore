//
//  NSArray+GOLPositionsToCellCollections.h
//  GameOfLife
//
//  Created by Will Grange on 06/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOLCellCollection;

@interface NSArray (GOLPositionsToCellCollections)

- (GOLCellCollection *)positionsToLivingCellCollection;
- (GOLCellCollection *)positionsToDeadCellCollection;

@end
