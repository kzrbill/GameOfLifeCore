//
//  CellCollectionFactory.m
//  GameOfLifeCore
//
//  Created by Will Grange on 05/09/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import "GOLRandomCellCollectionFactory.h"
#import "GOLCellCollection.h"

@interface GOLRandomCellCollectionFactory ()

@property (nonatomic, assign) NSRange xRange;
@property (nonatomic, assign) NSRange yRange;
@property (nonatomic, assign) NSRange countRange;

@end

@implementation GOLRandomCellCollectionFactory

- (instancetype)initWithXRange:(NSRange)xRange
                        yRange:(NSRange)yRange
                    countRange:(NSRange)countRange;
{
    self = [super init];
    if (self) {
        self.xRange = xRange;
        self.yRange = yRange;
        self.countRange = countRange;
    }
    return self;
}

- (GOLCellCollection *)generateCollection;
{
    GOLCellCollection *cellCollection = [[GOLCellCollection alloc] init];
    
    NSInteger count = [self randomNumberFromRange:self.countRange];

    for (NSUInteger i = 0; i < count; i++)
    {
        NSInteger x = [self randomNumberFromRange:self.xRange];
        NSInteger y = [self randomNumberFromRange:self.yRange];
        
        [cellCollection addLivingAtX:x y:y];
    }
    
    return cellCollection;
}

- (NSInteger)randomNumberFromRange:(NSRange)range;
{
    NSInteger lower = range.location;
    NSInteger upper = range.length;
    return lower + arc4random() % (upper - lower);
}

@end
