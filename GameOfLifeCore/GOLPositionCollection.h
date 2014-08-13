//
//  GOLPositionCollection.h
//  GameOfLifeCore
//
//  Created by Will Grange on 13/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLCellCollection.h"

@interface GOLPositionCollection : GOLCellCollection

- (void)setCell:(id<GOLCellType>)cell y:(NSInteger)x y:y;

@end
