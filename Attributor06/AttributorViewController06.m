//
//  AttributorViewController06.m
//  Attributor06
//
//  Created by MacMan on 10/4/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController06.h"
#import "TextStatsViewController06.h"

@interface AttributorViewController06 ()
@property(weak,nonatomic)IBOutlet UITextView *textBody;
@property(weak,nonatomic)IBOutlet UILabel *headline;
@property(weak,nonatomic)IBOutlet UIButton *outlineButton;
@property(weak,nonatomic)IBOutlet UIButton *unOutlineButton;

@end

@implementation AttributorViewController06


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"textToAnalyzeSegue"]){
    
        if([segue.destinationViewController isKindOfClass:[TextStatsViewController06 class]]){
            TextStatsViewController06 *tsvc = (TextStatsViewController06 *)segue.destinationViewController;
            tsvc.textToAnalyze = self.textBody.textStorage;
                
            }
            
        }
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupOutlineButton];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
}

-(void)setupOutlineButton{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    
    [title setAttributes:@{NSStrokeWidthAttributeName:@3,
                           NSStrokeWidthAttributeName:self.outlineButton.tintColor}
     
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(IBAction)changeTextBodyColor:(UIButton *)sender{
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
    
}

-(IBAction)outlineButton:(UIButton *)sender{
    
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,
                                              NSStrokeWidthAttributeName:[UIColor blackColor]}
                                       range:self.textBody.selectedRange];
}

















@end
