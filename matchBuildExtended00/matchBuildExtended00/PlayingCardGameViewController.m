//
//  PlayingCardGameViewController.m
//  matchBuildExtended00
//
//  Created by MacMan on 9/26/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}


@end
