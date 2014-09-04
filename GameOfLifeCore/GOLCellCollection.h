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
- (void)addLivingAtX:(NSInteger)x y:(NSInteger)y;
- (id<GOLCellType>)cellAtX:(NSInteger)x y:(NSInteger)y;

#pragma mark - Enumeration
- (NSUInteger)count;
- (id<GOLCellType>)cellAtIndex:(NSUInteger)index; // Only exists to support tests. Could remove.
- (id<GOLCellType>)cellByKey:(NSString *)key; // Key Should not be publicly exposed. Need to sort face enumeration so does not work by key, rather return the cell.
@end
