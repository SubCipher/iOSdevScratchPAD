//
//  PlayingCard.h
//  matchBuild03
//
//  Created by MacMan on 9/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic)NSString *suit;

@property(nonatomic) NSUInteger rank;


+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
