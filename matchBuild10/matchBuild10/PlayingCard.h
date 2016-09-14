//
//  PlayingCard.h
//  matchBuild10
//
//  Created by MacMan on 9/13/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;


@end
