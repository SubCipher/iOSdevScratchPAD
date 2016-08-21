//
//  kpCard.m
//  myTestBed
//
//  Created by MacMan on 8/20/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "kpCard.h"

@implementation kpCard


-(NSString *)enterSomeContent:(NSString *)thisContent{
    
    _contents = thisContent;
    
    return _contents;
}

-(void)compareContent:(NSString *)compareThisContent{
    
    int ans = [self.contents isEqual:compareThisContent];
    if(ans > 0){
        _matched = ans;
        NSLog(@"%@ matche`s %@ [%d]",self.contents,compareThisContent,_matched);
    }else{
        _matched = ans;
        NSLog(@" %@ does not match %@ [%d]",self.contents,compareThisContent,_matched);
    }
}

@end
