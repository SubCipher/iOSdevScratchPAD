//
//  PlayingCard.m
//  matchBuild07
//
//  Created by MacMan on 9/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCard.h"



@implementation PlayingCard
@synthesize suit = _suit;

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    if([otherCards count] ==1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank ==self.rank){
            score = 4;
        }else if([otherCard.suit isEqualToString:self.suit]){
            score =1;
        }
    }return  score;
}


+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)validSuits{
    
    return @[@"♦️",@"♥️",@"♠️",@"♣️"];
}

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits]containsObject:suit]){
        _suit = suit;
    }

}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}


-(void)setRank:(NSInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}


+(NSUInteger)maxRank{
    return [[PlayingCard rankStrings]count] -1;
}
@end

















