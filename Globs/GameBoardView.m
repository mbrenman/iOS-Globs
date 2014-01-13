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
        
        self.blockSideLength = ([self bounds].size.width)/((CGFloat)self.length - 1);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 4.0);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        
        for (int y = 0; y < self.length; y++){
            for (int x = 0; x < self.length; x++){
                CGRect rectangle = CGRectMake(0,0,self.blockSideLength * x,self.blockSideLength * y);
                CGContextAddRect(context, rectangle);
                CGContextStrokePath(context);
            }
        }
        
    } else {
        NSLog(@"Sorry, no board");
    }
}


@end
