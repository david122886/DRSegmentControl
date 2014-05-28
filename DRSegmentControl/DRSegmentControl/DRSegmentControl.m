//
//  DRSegmentControl.m
//  DRSegmentControl
//
//  Created by xxsy-ima001 on 14-5-28.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import "DRSegmentControl.h"
@interface DRSegmentControl()
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *itemOneBt;
@property (weak, nonatomic) IBOutlet UIButton *itemTwoBt;
@property (weak, nonatomic) IBOutlet UIButton *itemThreeBt;
- (IBAction)itemOneClicked:(id)sender;
- (IBAction)itemTwoClicked:(id)sender;
- (IBAction)itemThreeClicked:(id)sender;


@end

@implementation DRSegmentControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
+(id)defaultFromNib{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DRSegmentControl" owner:self options:nil];
    DRSegmentControl *control = array[0];
    CGRect rect = [control.itemOneBt.superview convertRect:control.itemOneBt.frame toView:control];
    control.lineView.frame = (CGRect){CGRectGetMinX(rect),CGRectGetMaxY(rect),CGRectGetWidth(rect),2};
    return control;
}
- (IBAction)itemOneClicked:(id)sender {
    [self enableAllItems];
    [[self viewWithTag:100] setUserInteractionEnabled:NO];
    [self beginMoveTipLine:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(drsegmentControl:didselectedAtIndex:)]) {
        [self.delegate drsegmentControl:self didselectedAtIndex:0];
    }
    
}

- (IBAction)itemTwoClicked:(id)sender {
    [self enableAllItems];
    [[self viewWithTag:101] setUserInteractionEnabled:NO];
    [self beginMoveTipLine:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(drsegmentControl:didselectedAtIndex:)]) {
        [self.delegate drsegmentControl:self didselectedAtIndex:1];
    }
}

- (IBAction)itemThreeClicked:(id)sender {
    [self enableAllItems];
    [[self viewWithTag:102] setUserInteractionEnabled:NO];
    [self beginMoveTipLine:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(drsegmentControl:didselectedAtIndex:)]) {
        [self.delegate drsegmentControl:self didselectedAtIndex:2];
    }
}

-(void)enableAllItems{
    for (UIView *subView in self.subviews) {
        [subView setUserInteractionEnabled:YES];
    }
}

-(void)beginMoveTipLine:(UIView*)sender{
    [self setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = [sender.superview convertRect:sender.frame toView:self];
        self.lineView.frame = (CGRect){CGRectGetMinX(rect),CGRectGetMaxY(rect),CGRectGetWidth(rect),2};
    } completion:^(BOOL finished) {
        [self setUserInteractionEnabled:YES];
    }];
}
@end
