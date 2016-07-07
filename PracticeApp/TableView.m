//
//  TableView.m
//  PracticeApp
//
//  Created by Alex Tsyganov on 15/06/2016.
//  Copyright © 2016 Alex Tsyganov. All rights reserved.
//

#import "TableView.h"

@implementation TableView

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
}


// override points for subclasses to control delivery of touch events to subviews of the scroll view
// called before touches are delivered to a subview of the scroll view. if it returns NO the touches will not be delivered to the subview
// this has no effect on presses
// default returns YES
- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event inContentView:(UIView *)view
{
     NSLog(@"touchesShouldBegin");
    return false;
}
// called before scrolling begins if touches have already been delivered to a subview of the scroll view. if it returns NO the touches will continue to be delivered to the subview and scrolling will not occur
// not called if canCancelContentTouches is NO. default returns YES if view isn't a UIControl
// this has no effect on presses
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
     NSLog(@"touchesShouldCancelInContentView");
    return [super touchesShouldCancelInContentView:view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
