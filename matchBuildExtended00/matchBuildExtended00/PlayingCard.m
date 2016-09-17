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


-(int)match:(NSArray *)otherCards{
  
    NSLog(@"----match function in PlayingCard.m----");
   for(PlayingCard *otherCard in otherCards){
       
    if([otherCards count] == 1){
        if(otherCard.rank == self.rank){
            self.score++;
        
        }
        else if([otherCard.suit isEqualToString:self.suit]){
            self.score++;
            
        }
        
        NSLog(@"     ");
        NSLog(@"otherCard.contents: %@ == self.contents: %@ = %d",otherCard.contents,self.contents,otherCard.contents==self.contents);
        NSLog(@"otherCard.rank :%lu == self.rank :%lu = %d",otherCard.rank,self.rank,otherCard.rank ==self.rank);
        NSLog(@"otherCard.suit: %@ == self.suit: %@ = %d",otherCard.suit,self.suit,otherCard.suit ==self.suit);
        NSLog(@"     ");
        NSLog(@"     ");
        NSLog(@"---------End Match Check-------------");
    }
        
    }return self.score;
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
