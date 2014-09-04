//
//  GOLCellCollection.m
//  GameOfLife
//
//  Created by Will Grange on 25/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLCellCollection.h"
#import "GOLCellType.h"
#import "GOLPosition.h"
#import "GOLLivingCell.h"


@interface GOLCellCollection ()

@property (nonatomic, strong) NSMutableArray *indexes;
@property (nonatomic, strong) NSMutableDictionary *locationKeyedCells;

@end

@implementation GOLCellCollection

#pragma mark - Initialaliser

- (instancetype)initWithCellsArray:(NSArray *)cellArray
{
    self = [super init];
    if (self) {
        [self addCells:cellArray];
    }
    return self;
}

#pragma mark - Location based

- (void)setLocationX:(NSInteger)x y:(NSInteger)y forCell:(id<GOLCellType>)cell;
{
    NSString *key = [self keyUsingX:x y:y];
    self.locationKeyedCells[key] = cell;
    [self.indexes addObject:key];
}

- (NSString *)keyUsingX:(NSInteger)x y:(NSInteger)y;
{
    return [NSString stringWithFormat:@"%ld|%ld", (long)x, (long)y];
}

- (NSMutableDictionary *)locationKeyedCells;
{
    return _locationKeyedCells = _locationKeyedCells ?: [[NSMutableDictionary alloc] init];
}

- (NSMutableArray *)indexes;
{
    return _indexes = _indexes ?: [[NSMutableArray alloc] init];
}

- (void)addCells:(NSArray *)cells;
{
    for (id<GOLCellType> cell in cells)
    {
        [self addCell:cell];
    }
}

#pragma mark -

- (void)addLivingAtX:(NSInteger)x y:(NSInteger)y;
{
    GOLLivingCell *cell = [GOLLivingCell cellWithPosition:[GOLPosition positionWithX:x Y:y]];
    [self setLocationX:cell.position.x y:cell.position.y forCell:cell];
}

- (void)addCell:(id<GOLCellType>)cell;
{
    [self setLocationX:cell.position.x y:cell.position.y forCell:cell];
}

- (NSUInteger)count
{
    return [self.locationKeyedCells count];
}

- (id<GOLCellType>)cellAtIndex:(NSUInteger)index;
{
    NSString *key = self.indexes[index];
    return self.locationKeyedCells[key];
}

- (id<GOLCellType>)cellAtX:(NSInteger)x y:(NSInteger)y;
{
    NSString *key = [self keyUsingX:x y:y];
    return self.locationKeyedCells[key];
}

- (id<GOLCellType>)cellByKey:(NSString *)key;
{
    return self.locationKeyedCells[key];
}

- (BOOL)isEqual:(id)otherObject
{
    if (![otherObject isKindOfClass:self.class])
    {
        return NO;
    }
    
    GOLCellCollection *otherCellCollection = otherObject;
    return [self.locationKeyedCells isEqualToDictionary:otherCellCollection.locationKeyedCells];
}

- (NSUInteger)hash;
{
    return [self.locationKeyedCells hash];
}

#pragma mark - NSFastEnumeration

// TODO: Fix this returning string key in enumeration
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len;
{
    return [self.locationKeyedCells countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark -

@end
