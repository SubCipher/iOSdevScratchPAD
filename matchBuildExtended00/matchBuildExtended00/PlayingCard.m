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
        NSLog(@"--------------------");
        NSLog(@"    ");

        NSLog(@"Set To Match");
        NSLog(@"  ");
        NSLog(@"card: %lu%@ == otherCard: %lu%@ == R: %d | S %d",self.rank,self.suit,otherCard.rank,otherCard.suit,self.rank == otherCard.rank,self.suit == otherCard.suit);
      
        
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