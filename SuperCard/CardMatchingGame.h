//
//  CardMatchingGame.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSInteger)index;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

@property(nonatomic,readonly)int score;
@property(nonatomic)NSInteger singleOrMultipleOption;




@end
