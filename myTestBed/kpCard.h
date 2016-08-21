//
//  kpCard.h
//  myTestBed
//
//  Created by MacMan on 8/20/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kpCard : NSObject

@property (strong,nonatomic)NSString *contents;

@property (nonatomic,getter=isChoosen)BOOL chosen;
@property (nonatomic,getter=isMatched)BOOL matched;


-(NSString *)enterSomeContent:(NSString *)thisContent;

-(void)compareContent:(NSString *)compareThisContent;



@end
