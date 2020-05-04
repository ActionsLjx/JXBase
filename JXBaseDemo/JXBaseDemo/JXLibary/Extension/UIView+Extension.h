//
//  UIView+Extension.h
//  JXDemo
//
//  Created by _ljx on 2019/12/27.
//  Copyright © 2019 _ljx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)

#pragma mark Animation Rotating 旋转
-(void)JXStartRotatingWith;
-(void)JXStopRotating;

#pragma mark Cut Corner 切角
- (void)JXCutCornerWithCororType:(UIRectCorner)type
                   cornerRadii:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
