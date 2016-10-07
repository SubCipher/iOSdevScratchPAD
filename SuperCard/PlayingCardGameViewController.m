//
//  PlayingCardGameViewController.m
//  SuperCard
//
//  Created by MacMan on 10/6/16.
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
