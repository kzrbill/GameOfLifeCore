//
//  GOLPositionCollection.h
//  GameOfLifeCore
//
//  Created by Will Grange on 13/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLCellCollection.h"

@interface GOLLocations : GOLCellCollection

- (void)setLocationX:(NSInteger)x y:(NSInteger)y forCell:(id<GOLCellType>)cell;
- (NSArray *)locations;

@end
