//
//  PlayingCard.h
//  kpMatchingGame
//
//  Created by MacMan on 8/26/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"
#import "Deck.h"

@interface PlayingCard : Card

@property (strong,nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
