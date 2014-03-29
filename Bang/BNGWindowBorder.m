//
//  BNGWindowBorder.m
//  Bang
//
//  Created by Jesse on 14-3-29.
//  Copyright (c) 2014年 Taobao. All rights reserved.
//

#import "BNGWindowBorder.h"

@implementation BNGWindowBorder

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    CGFloat roundedRectangleCornerRadius = 5;
    CGFloat arrowHeight = 10;
    CGFloat arrowWidth = 20;
    NSRect roundedRectangleRect = NSMakeRect(0, 0, NSWidth(self.bounds), NSHeight(self.bounds) - arrowHeight);
    NSRect roundedRectangleInnerRect = NSInsetRect(roundedRectangleRect, roundedRectangleCornerRadius, roundedRectangleCornerRadius);
    NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPath];
    [roundedRectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(roundedRectangleInnerRect), NSMinY(roundedRectangleInnerRect)) radius: roundedRectangleCornerRadius startAngle: 180 endAngle: 270];
    [roundedRectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(roundedRectangleInnerRect), NSMinY(roundedRectangleInnerRect)) radius: roundedRectangleCornerRadius startAngle: 270 endAngle: 360];
    [roundedRectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(roundedRectangleInnerRect), NSMaxY(roundedRectangleInnerRect)) radius: roundedRectangleCornerRadius startAngle: 0 endAngle: 90];
    
    [roundedRectanglePath lineToPoint:NSMakePoint(NSMidX(roundedRectangleRect) - arrowWidth / 2, NSMaxY(roundedRectangleRect))];
    [roundedRectanglePath lineToPoint:NSMakePoint(NSMidX(roundedRectangleRect), NSMaxY(roundedRectangleRect) + arrowHeight)];
    [roundedRectanglePath lineToPoint:NSMakePoint(NSMidX(roundedRectangleRect) + arrowWidth / 2, NSMaxY(roundedRectangleRect))];
    
    [roundedRectanglePath appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(roundedRectangleInnerRect), NSMaxY(roundedRectangleInnerRect)) radius: roundedRectangleCornerRadius startAngle: 90 endAngle: 180];
    [roundedRectanglePath closePath];
    
    
    [[NSColor controlColor] setFill];
    [roundedRectanglePath fill];

}

@end
