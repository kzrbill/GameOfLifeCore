//
//  GOLCell.h
//  GameOfLife
//
//  Created by Will Grange on 18/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellType.h"

@class GOLCellCollection, GOLPosition, GOLCellNeighbours;

@interface GOLLivingCell : NSObject <GOLCellType>

@property (nonatomic, strong, readonly) GOLPosition *position;

- (id)initWithPosition:(GOLPosition *)postion;
+ (instancetype)cellWithPosition:(GOLPosition *)postion;
- (BOOL)shouldBeLiving:(Byte)livingNeighborCellCount;

@end
