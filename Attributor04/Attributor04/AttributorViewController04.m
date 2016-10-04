//
//  AttributorViewController04.m
//  Attributor04
//
//  Created by MacMan on 10/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController04.h"

@interface AttributorViewController04 ()

@property(weak,nonatomic)IBOutlet UITextView *textBody;
@property(weak,nonatomic)IBOutlet UIButton *outlineButton;
@property(weak,nonatomic)IBOutlet UILabel *headline;


@end

@implementation AttributorViewController04


-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
}


-(void)preferredFontsDidChange:(NSNotification *)notification{
    
}

-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
}

-(void)setupOutlineButton{
    
}


-(IBAction)outlineButton:(UIButton *)sender{
    
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@3,
                                              NSStrokeColorAttributeName:[UIColor blackColor]}
    
                                       range:self.textBody.selectedRange];
}

-(IBAction)colorTextBodySelection:(UIButton *)sender{
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
    
}


-(IBAction)UnOutlineButton:(UIButton *)sender{
    [self.textBody.textStorage removeAttribute:NSStrokeColorAttributeName range:self.textBody.selectedRange];
}



@end
