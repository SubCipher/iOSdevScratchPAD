//
//  main.m
//  myTestBed
//
//  Created by MacMan on 8/20/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kpCard.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        kpCard *content1 = [[kpCard alloc]init];
        
        [content1 enterSomeContent:@"A♣️"];
        
        [content1 compareContent:@"A♠️"];
        [content1 compareContent:@"A♥️"];
        [content1 compareContent:@"A♣️"];
        [content1 compareContent:@"A♦️"];
        
        
    }
    return 0;
}
