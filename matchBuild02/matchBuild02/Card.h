//
//  Card.h
//  matchBuild02
//
//  Created by MacMan on 8/29/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic)NSString *contents;
@property (nonatomic,getter=isChosen)BOOL chosen;
@property (nonatomic,getter=isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
