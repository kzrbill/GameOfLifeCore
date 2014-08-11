//
//  GOLNeighborFinder.h
//  GameOfLife
//
//  Created by Will Grange on 30/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOLCellCollection, GOLPosition, GOLLivingCell;

@interface GOLNeighborFinder : NSObject

- (instancetype)initWithLivingCellCollection:(GOLCellCollection *)cellCollection centerPosition:(GOLPosition *)centerPosition;
- (GOLCellCollection *)livingNeighbors;
- (GOLCellCollection *)deadNeighbors;

@end
