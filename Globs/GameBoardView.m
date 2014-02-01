//
//  GameBoardView.m
//  Globs
//
//  Created by Matt Brenman on 1/11/14.
//  Copyright (c) 2014 mbrenman. All rights reserved.
//

#import "GameBoardView.h"
#import "ViewController.h"

@interface GameBoardView ()

@property (nonatomic) CGFloat blockSideLength;

@end

@implementation GameBoardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //initialize
    }
    return self;
}

- (void) setBoard:(int *)board{
    _board = board;
    //redraw on changed board
    [self setNeedsDisplay];

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (self.board){
        
        self.blockSideLength = ([self bounds].size.width)/((CGFloat)self.length);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 4.0);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        
        for (int y = 0; y < self.length; y++){
            for (int x = 0; x < self.length; x++){
                
                int idex = [self calculateIndexOf:y and: x];
                
                UIColor *color = [self calculateColorWithNumber:self.board[idex]];
                CGContextSetStrokeColorWithColor(context, color.CGColor);
                CGContextSetFillColorWithColor(context, color.CGColor);
                
                CGRect rectangle = CGRectMake(self.blockSideLength * x,
                                              self.blockSideLength * y,
                                              self.blockSideLength,
                                              self.blockSideLength);
                CGContextAddRect(context, rectangle);
                CGContextStrokePath(context);
                UIRectFill(rectangle);
            }
        }
        
    } else {
        NSLog(@"Sorry, no board");
    }
}

-(UIColor *)calculateColorWithNumber: (int)num
{
    CGFloat red = ((255.0f/(CGFloat)self.numColors)*(CGFloat)num)/255.0f;
    UIColor *color = [UIColor colorWithRed:red green:0.5f blue:0.5f alpha:1];
    return color;
}

- (int)calculateIndexOf:(int)row and:(int)col
{
    int index = col + (row * [self length]);
    
    //Check bounds?
    
    return index;
}

@end
