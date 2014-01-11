//
//  ViewController.m
//  Globs
//
//  Created by Matt Brenman on 1/10/14.
//  Copyright (c) 2014 mbrenman. All rights reserved.
//

#import "ViewController.h"
#import "GlobsGame.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    GlobsGame *game = [[GlobsGame  alloc] initWith:6 and:5];
    [game print];
    for (int i = 0; i < 10; i++){
        int move = arc4random() % 5;
        NSLog(@"Playing: %d", move);
        if ([game performMoveWith:move]) {
            NSLog(@"Yayyyyyyyyyy");
        }
        [game print];
    }
    [game endGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
