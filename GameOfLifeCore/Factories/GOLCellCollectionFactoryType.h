//
//  GOLCellCollectionFactoryType.h
//  GameOfLifeCore
//
//  Created by Will Grange on 05/09/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOLCellCollection;

@protocol GOLCellCollectionFactoryType <NSObject>

- (GOLCellCollection *)generateCollection;

@end
