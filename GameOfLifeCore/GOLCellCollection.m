//
//  GOLCellCollection.m
//  GameOfLife
//
//  Created by Will Grange on 25/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLCellCollection.h"

@interface GOLCellCollection ()

@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation GOLCellCollection

#pragma mark - Initialaliser

- (instancetype)initWithCellsArray:(NSArray *)cellArray
{
    self = [super init];
    if (self) {
        _cells = [NSMutableArray arrayWithArray:cellArray];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cells = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)collectionWithCellsArray:(NSArray *)cellsArray
{
    return [[GOLCellCollection alloc] initWithCellsArray:cellsArray];
}

#pragma mark -

- (NSMutableArray *)cells
{
    if (!_cells){
        _cells = [[NSMutableArray alloc] init];
    }
    
    return _cells;
}

- (void)addCell:(id<GOLCellType>)cell;
{
    [self.cells addObject:cell];
}

- (NSUInteger)count
{
    return [self.cells count];
}

- (id<GOLCellType>)cellAtIndex:(NSUInteger)index;
{
    return [self.cells objectAtIndex:index];
}

- (GOLCellCollection *)filteredCellCollectionUsingPredicate:(NSPredicate *)predicate;
{
    NSArray *filteredCells = [self.cells filteredArrayUsingPredicate:predicate];
    return [[GOLCellCollection alloc] initWithCellsArray:filteredCells];
}

- (BOOL)isEqual:(id)otherObject
{
    if (![otherObject isKindOfClass:self.class])
    {
        return NO;
    }
    
    GOLCellCollection *otherCellCollection = otherObject;
    return [self.cells isEqualToArray:otherCellCollection.cells];
}

- (NSUInteger)hash;
{
    return [self.cells hash];
}

#pragma mark - NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len;
{
    return [self.cells countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark -

@end
