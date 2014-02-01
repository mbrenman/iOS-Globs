//
//  GameBoardView.h
//  Globs
//
//  Created by Matt Brenman on 1/11/14.
//  Copyright (c) 2014 mbrenman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameBoardView : UIView

@property (nonatomic) int *board;
@property (nonatomic) int length;
@property (nonatomic) int numColors;
@property (nonatomic) NSMutableArray *gameColors;

@end
