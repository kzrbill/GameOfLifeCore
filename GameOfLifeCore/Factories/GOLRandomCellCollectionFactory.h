//
//  CellCollectionFactory.h
//  GameOfLifeCore
//
//  Created by Will Grange on 05/09/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellCollectionFactoryType.h"

@class GOLCellCollection;

@interface GOLRandomCellCollectionFactory : NSObject <GOLCellCollectionFactoryType>

- (instancetype)initWithXRange:(NSRange)xRange
                        yRange:(NSRange)yRange
                    countRange:(NSRange)countRange;

- (GOLCellCollection *)generateCollection;

@end
