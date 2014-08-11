//
//  GOLDeadCell.h
//  GameOfLife
//
//  Created by Will Grange on 02/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellType.h"

@interface GOLDeadCell : NSObject <GOLCellType>

@property (nonatomic, strong, readonly) GOLPosition *position;

- (id)initWithPosition:(GOLPosition *)postion;
- (BOOL)shouldBeLiving:(Byte)livingNeighborCellCount;

@end
