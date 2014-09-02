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

- (instancetype)initWithCellsArray:(NSArray *)cellArray; // Lowish impact of change. Callers are GOLBlinkerCellCollection.
+ (instancetype)collectionWithCellsArray:(NSArray *)cellsArray; // Low impact of change. Callers are non existent. (just delete)
- (void)addCell:(id<GOLCellType>)cell; // High impact of change. Lots of touch points though can probably leave as is and have cell collection store cell against x|y positions.
- (NSUInteger)count; // Support this method being used to iterate over cells. So where does this occure? CellCollectionTests.
- (id<GOLCellType>)cellAtIndex:(NSUInteger)index; // Still want to support this for now.
- (GOLCellCollection *)filteredCellCollectionUsingPredicate:(NSPredicate *)predicate; // Lowish impact of change neighbor finder uses this.
@end
