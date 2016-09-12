//
//  PlayingCard.h
//  matchBuild07
//
//  Created by MacMan on 9/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(nonatomic,strong)NSString *suit;
@property(nonatomic)NSInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;


@end
