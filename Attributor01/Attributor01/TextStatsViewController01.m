//
//  TextStatsViewController01.m
//  Attributor01
//
//  Created by MacMan on 9/30/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController01.h"

@interface TextStatsViewController01 ()

@property (weak, nonatomic) IBOutlet UILabel *colorFulTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedTextLabel;

@end

@implementation TextStatsViewController01


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}


-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
}

-(void)updateUI{
    self.colorFulTextLabel.text =[NSString stringWithFormat:@"%lu colorful characters",[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
    self.outlinedTextLabel.text = [NSString stringWithFormat:@"%lu outlined characters",[[self charactersWithAttribute:NSStrokeColorAttributeName]length]];
}

-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    long index =0;
    while(index < [self.textToAnalyze length]){
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
             index =range.location + range.length;
             }else{
                 index++;
             }
        
             }return characters;
}


@end
