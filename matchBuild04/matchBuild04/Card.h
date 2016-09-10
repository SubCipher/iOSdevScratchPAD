//
//  Card.h
//  matchBuild04
//
//  Created by MacMan on 9/6/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong,nonatomic)NSString *contents;

@property(nonatomic,getter=isChosen)BOOL chosen;
@property(nonatomic,getter=isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
