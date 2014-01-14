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

@property (nonatomic, strong) GlobsGame *game;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //TODO: Get these parameters from preferences
    if (!self.game){
        self.game = [[GlobsGame  alloc] initWith:6 and:5];
    }
    [self.game print];
    //Initialize the game
    [self.GameBoard setBoard:[self.game board]];
    [self.GameBoard setLength:[self.game length]];
    [self.GameBoard setNumColors:[self.game numColors]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //Cleaning up dynamic memory of the gameboard
    [self.game endGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
