//
//  GOLBlinkerCellCollection.m
//  GameOfLifeCore
//
//  Created by Will Grange on 12/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLBlinkerCellCollection.h"
#import "GOLLivingCell.h"
#import "GOLPosition.h"

@implementation GOLBlinkerCellCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addLivingAtX:0 y:0];
        [self addLivingAtX:0 y:1];
        [self addLivingAtX:0 y:2];
    }
    return self;
}

@end
