//
//  GOLPositionCollection.m
//  GameOfLifeCore
//
//  Created by Will Grange on 13/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLLocations.h"
#import "GOLLocation.h"

@interface Location : NSObject
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@end

@implementation Location
@end

@interface GOLLocations ()

@property (nonatomic, strong) NSMutableDictionary *locationKeyedCells;

@end

@implementation GOLLocations

- (void)setLocationX:(NSInteger)x y:(NSInteger)y forCell:(id<GOLCellType>)cell;
{
    NSString *key = [self keyUsingX:x y:y];
    self.locationKeyedCells[key] = cell;
}

- (NSArray *)locations;
{
    return [self.locationKeyedCells allValues];
}

- (NSString *)keyUsingX:(NSInteger)x y:(NSInteger)y;
{
    return [NSString stringWithFormat:@"%ld|%ld", (long)x, (long)y];
}

- (GOLLocation *)locationFromKey:(NSString *)key;
{
    NSArray *components = [key componentsSeparatedByString:@"|"];
    GOLLocation *location = [[GOLLocation alloc] init];
    location.x = [components[0] intValue];
    location.y = [components[1] intValue];
    location = self.locationKeyedCells[key];
    return location;
}

- (NSMutableDictionary *)locationKeyedCells;
{
    return _locationKeyedCells = _locationKeyedCells ?: [[NSMutableDictionary alloc] init];
}

@end
