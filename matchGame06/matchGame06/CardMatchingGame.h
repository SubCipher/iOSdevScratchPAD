//
//  CardMatchingGame.h
//  matchGame06
//
//  Created by MacMan on 9/10/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)Count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)count;
-(Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly)NSInteger score;



@end
