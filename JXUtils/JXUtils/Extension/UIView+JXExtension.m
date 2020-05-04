//
//  UIView+JXExtension.m
//  JXDemo
//
//  Created by _ljx on 2019/12/27.
//  Copyright © 2019 _ljx. All rights reserved.
//

#import "UIView+JXExtension.h"

@implementation UIView (Extension)
- (void)JXStartRotatingWith {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    
    rotationAnimation.duration = 1;
    
    rotationAnimation.cumulative = YES;
    
    rotationAnimation.repeatCount = HUGE;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)JXStopAnimation{
    [self.layer removeAllAnimations];
}

- (void)JXStartFipWithDirection:(CATransitionSubtype)direction {
    CATransition *animation = [CATransition animation];
    animation.duration = .3f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"oglFlip";
    animation.subtype = direction;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)JXCutCornerWithCororType:(UIRectCorner)type
                   cornerRadii:(CGSize)size{
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
              maskLayer.frame = self.bounds;
              
              UIBezierPath * maskPath;
              if(type == UIRectCornerTopLeft|| type == UIRectCornerTopRight){
                  maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:size];
              }else if(type == UIRectCornerBottomLeft || type == UIRectCornerBottomRight){
                  maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:size];
              }
              maskLayer.path = maskPath.CGPath;
              self.layer.mask = maskLayer;
}
@end
