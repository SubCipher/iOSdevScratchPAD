//
//  PlayingCard.h
//  matchBuild02
//
//  Created by MacMan on 8/29/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;


@end
