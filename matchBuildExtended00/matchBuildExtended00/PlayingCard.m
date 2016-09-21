//
//  PlayingCard.m
//  matchBuildExtended00
//
//  Created by MacMan on 9/14/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//



#import "PlayingCard.h"

@interface PlayingCard()

@property (nonatomic)int score;

@end

@implementation PlayingCard
@synthesize suit = _suit;



-(int)match:(NSMutableArray *)otherCards{
    int score = 0;
    if([otherCards count]){
       
        PlayingCard *otherCard = [otherCards firstObject];
        
            if(self.rank == otherCard.rank){
                score = 4;
                
            } else if(self.suit == otherCard.suit){
                score = 1;
           
            }
        NSLog(@" NEW SET ");
        NSLog(@"  ");
        NSLog(@"self.rank: %lu == otherCard.rank: %lu = %d",self.rank,otherCard.rank,self.rank == otherCard.rank);
        NSLog(@"self.contents: %@ == otherCard.contents: %@ = %d",self.suit, otherCard.suit,self.suit == otherCard.suit);
        NSLog(@"--------------------");

        
    }return score;
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
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit  : @ "?";
}

-(void)setRank:(NSUInteger)rank{
    
    if(rank <[PlayingCard maxRank]){
        _rank = rank;
    }
}

+(NSUInteger)maxRank{
    return [[self rankStrings ]count] -1;
}


@end
