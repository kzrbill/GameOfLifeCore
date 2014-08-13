//
//  GOLLocation.h
//  GameOfLifeCore
//
//  Created by Will Grange on 13/08/2014.
//  Copyright (c) 2014 Will Grange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOLCellType.h"

@interface GOLLocation : NSObject
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, strong) id<GOLCellType> cell;
@end
