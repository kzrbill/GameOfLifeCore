//
//  GOLCellCollection.h
//  GameOfLife
//
//  Created by Will Grange on 25/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellType.h"

@interface GOLCellCollection : NSObject <NSFastEnumeration>

- (instancetype)initWithCellsArray:(NSArray *)cellArray; 
- (void)addCell:(id<GOLCellType>)cell;
- (NSUInteger)count;
- (id<GOLCellType>)cellAtIndex:(NSUInteger)index;
- (id<GOLCellType>)cellAtX:(NSInteger)x y:(NSInteger)y;
- (GOLCellCollection *)filteredCellCollectionUsingPredicate:(NSPredicate *)predicate;
@end
