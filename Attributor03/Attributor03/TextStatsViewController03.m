//
//  TextStatsViewController03.m
//  Attributor03
//
//  Created by MacMan on 10/2/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController03.h"

@interface TextStatsViewController03 ()

@property(weak,nonatomic)IBOutlet UILabel *colorFulCharacters;
@property(weak,nonatomic)IBOutlet UILabel *outlineCharacters;


@end

@implementation TextStatsViewController03


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}


-(void)updateUI{
    self.colorFulCharacters.text = [NSString stringWithFormat:@"%lu colorful characters",[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
    self.outlineCharacters.text = [NSString stringWithFormat:@"%lu outline characters",[[self charactersWithAttribute:NSStrokeColorAttributeName]length]];
}

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
    
}


-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    long index = 0;
    while(index < [self.textToAnalyze length]){
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }
        else{
            index++;
    }
    }return characters;
}

@end
