//
//  GOLStillLife.m
//  GameOfLife
//
//  Created by Will Grange on 06/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLBlockCellCollection.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"

@implementation GOLBlockCellCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addLivingAtX:0 y:0];
        [self addLivingAtX:1 y:0];
        [self addLivingAtX:0 y:1];
        [self addLivingAtX:1 y:1];
    }
    return self;
}

@end
