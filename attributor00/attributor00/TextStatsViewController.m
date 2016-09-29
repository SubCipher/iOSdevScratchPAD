//
//  TextStatsViewController.m
//  attributor00
//
//  Created by MacMan on 9/28/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}

-(void)updateUI{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters",[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters",[[self charactersWithAttribute:NSStrokeColorAttributeName] length]];
    
}
-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    long index =0;
    while(index < [self.textToAnalyze length]){
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        
        if(value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location+range.length;
        
        }else {
            index++;
    }
    }return characters;
}
@end
