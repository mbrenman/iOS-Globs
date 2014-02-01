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
        CGContextSetLineWidth(context, 1);
        
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
    UIColor *color = [[self getColorList] objectAtIndex:num];
    return color;
}

- (int)calculateIndexOf:(int)row and:(int)col
{
    int index = col + (row * [self length]);
    
    //Check bounds?
    
    return index;
}

- (NSArray *) getColorList
{
    if (!self.gameColors){
        self.gameColors = [[NSMutableArray alloc] init];
        NSArray *allColors = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor cyanColor], [UIColor orangeColor], [UIColor magentaColor], nil];
        int remainingColors = self.numColors;
        while (remainingColors){
            UIColor *randColor = [allColors objectAtIndex:arc4random() % [allColors count]];
            if ((! [self.gameColors containsObject:randColor]) && (randColor != nil)){
                [self.gameColors addObject:randColor];
                remainingColors--;
            }
        }
    }
    return self.gameColors;
}

@end
