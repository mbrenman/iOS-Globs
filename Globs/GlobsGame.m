//
//  Model.m
//  Globs
//
//  Created by Matt Brenman on 1/10/14.
//  Copyright (c) 2014 mbrenman. All rights reserved.
//

#import "GlobsGame.h"

@implementation GlobsGame

- (id)init
{
    return [self initWith:5 and:5];
}

- (id)initWith:(int)rows and:(int)numColors
{
    self = [super init];
    if (self){
        _size = rows * rows;
        _board = malloc([self size] * sizeof(int));
        _length = rows;
        _numColors = numColors;
        
        for (int i = 0; i < [self size]; i++){
            [self board][i] = arc4random() % [self numColors];
        }
    }
    return self;
}

- (BOOL)performMoveWith:(int)newColor
{
    //check that color is a valid color
    
    //get color to change
    int oldColor = [self board][0]; //Always top left
    
    //Start move at the top left and return YES if game has been won, else NO
    return (oldColor == newColor) ? NO : ([self performMoveWith:oldColor and:newColor at:0 and:0] == [self size]);
}

- (int)performMoveWith:(int)oldColor and:(int)newColor at:(int)row and:(int)col
{
    int colorIndex = [self calculateIndexOf:row and:col];
    int numChanged = 0;
    
    //bounds checking
    if ((row >= [self length]) || (col >= [self length]) || (row < 0) || (col < 0)) { return 0; }
    
    //See if color block should be changed
    if ([self board][colorIndex] == oldColor){
        numChanged += 1; //Changed current block
        
        //change color before recursing to avoid ping-pong looping
        [self board][colorIndex] = newColor;
    
        //Propagate through board
        numChanged += [self performMoveWith:oldColor and:newColor at:(row + 1) and:(col)];
        numChanged += [self performMoveWith:oldColor and:newColor at:(row - 1) and:(col)];
        numChanged += [self performMoveWith:oldColor and:newColor at:(row) and:(col + 1)];
        numChanged += [self performMoveWith:oldColor and:newColor at:(row) and:(col - 1)];
        
    }
    return numChanged; //placeholder
}

- (int)calculateIndexOf:(int)row and:(int)col
{
    int index = col + (row * [self length]);
    
    //Check bounds?
    
    return index;
}

- (void)endGame
{
    free(_board);
}

- (void)print
{
    NSMutableString *a = [[NSMutableString alloc] init];
    [a appendString:@"\n"];
    for (int i = 0; i < [self length]; i++){
        for (int j = 0; j < [self length]; j++){
            int idex = [self calculateIndexOf:i and:j];
            [a appendString:[NSString stringWithFormat:@"%d", [self board][idex]]];
        }
        [a appendString:@"\n"];
    }
    NSLog(@"%@", a);
}

@end
