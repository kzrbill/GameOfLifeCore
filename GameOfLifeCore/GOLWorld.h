//
//  GOLWorld.h
//  GameOfLife
//
//  Created by Will Grange on 19/07/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellCollection.h"

@interface GOLWorld : NSObject

- (BOOL)isEmpty;
- (void)seedWorldWithCells:(GOLCellCollection *)cellCollection;
- (GOLWorld *)evolve;

@end
