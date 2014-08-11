//
//  GOLCellType.h
//  GameOfLife
//
//  Created by Will Grange on 02/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOLPosition;

@protocol GOLCellType <NSObject>

@property (nonatomic, readonly) GOLPosition *position;

- (BOOL)shouldBeLiving:(Byte)livingNeighborCellCount;

@end
