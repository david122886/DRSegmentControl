//
//  DRSegmentControl.h
//  DRSegmentControl
//
//  Created by xxsy-ima001 on 14-5-28.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DRSegmentControl;
@protocol DRSegmentControlDelegate <NSObject>

-(void)drsegmentControl:(DRSegmentControl*)control didselectedAtIndex:(int)index;

@end

///自定义分段控件
@interface DRSegmentControl : UIView
+(id)defaultFromNib;
@property (weak,nonatomic) id<DRSegmentControlDelegate> delegate;
@end
