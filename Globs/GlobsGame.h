//
//  Model.h
//  Globs
//
//  Created by Matt Brenman on 1/10/14.
//  Copyright (c) 2014 mbrenman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobsGame : NSObject

@property int *board;
@property int size;
@property int length;
@property int numColors;

- (id)initWith:(int)rows and:(int)colors;
- (BOOL)performMoveWith:(int)color;
- (void)endGame;
- (void)print;
@end
