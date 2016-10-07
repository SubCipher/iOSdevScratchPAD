//
//  ViewController.m
//  SuperCard
//
//  Created by MacMan on 10/6/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playingCardView.suit = @"♦️";
    self.playingCardView.rank = 1;
    
    
}
@end
