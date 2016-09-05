//
//  PlayingCard.m
//  matchBuild03
//
//  Created by MacMan on 9/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard
@synthesize suit = _suit;

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)validSuits{
    return @[@"♣️",@"♦️",@"♠️",@"♥️"];
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

-(void)setRank:(NSUInteger)rank{
    if(rank <[PlayingCard maxRank]){
        _rank = rank;
    }
}


+(NSUInteger)maxRank{
    
    return [self.rankStrings count]-1;
    
    }

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@end















































