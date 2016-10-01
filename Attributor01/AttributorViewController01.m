//
//  AttributorViewController01.m
//  Attributor01
//
//  Created by MacMan on 9/30/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController01.h"
#import "TextStatsViewController01.h"

@interface AttributorViewController01 ()

@property (weak, nonatomic) IBOutlet UITextView *textBody;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end


@implementation AttributorViewController01


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"analyzeText"]){
        if([segue.destinationViewController isKindOfClass:[TextStatsViewController01 class]]){
            TextStatsViewController01 *tsvc = segue.destinationViewController;
            tsvc.textToAnalyze = self.textBody.textStorage;
        }
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];

}

-(void)setupOutlineButton{
    NSMutableAttributedString *title= [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName:@3,
                           NSStrokeWidthAttributeName:self.outlineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(preferredFontsChanged:)
                                                name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (IBAction)changeBodySelectionButton:(UIButton *)sender {
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
}


- (IBAction)outlineButton:(UIButton *)sender {
    [self.textBody.textStorage addAttributes:@{ NSStrokeWidthAttributeName:@-3,
                                                NSStrokeWidthAttributeName: [UIColor blackColor]}
    
                                       range:self.textBody.selectedRange];
}

- (IBAction)removeOutlineButton:(UIButton *)sender {
    [self.textBody.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.textBody.selectedRange];
}



@end
