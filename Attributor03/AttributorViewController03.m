//
//  AttributorViewController03.m
//  Attributor03
//
//  Created by MacMan on 10/2/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController03.h"

@interface AttributorViewController03 ()

@property(weak,nonatomic)IBOutlet UITextView *textBody;
@property(weak,nonatomic)IBOutlet UIButton *outlineButton;
@property(weak,nonatomic)IBOutlet UILabel *headline;
@property(weak,nonatomic)IBOutlet UIButton *unOutlineButton;


@end

@implementation AttributorViewController03


-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    
}


-(void)setupOutlineButton{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName:@3,
                                 NSStrokeWidthAttributeName:self.outlineButton.tintColor}
                         range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}


-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
}



-(IBAction)outlineButton:(UIButton *)sender{
    
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@3,
                                              NSStrokeColorAttributeName:[UIColor blackColor]}
                                       range:self.textBody.selectedRange];
}


-(IBAction)unOutline:(UIButton *)sender{
    
    [self.textBody.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.textBody.selectedRange];
    
}


-(IBAction)changeBodyTextColorFromSelection:(UIButton *)sender{
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
    
}




@end
