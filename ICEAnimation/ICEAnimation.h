//
//  ICEAnimation.h
//  ICEDK
//
//  Created by Icepat on 21/05/12.
//  Copyright (c) Icepat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ICEAnimation : NSObject {
    
}

// Transparency automatic.
+ (CABasicAnimation*)transparencyAnimation;
// Transparency manual.
+ (CABasicAnimation*)transparencyAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;
// Translate manual.
+ (CABasicAnimation*)translateAnimationFrom:(CGPoint)fromValue to:(CGPoint)toValue;
// Rotation on X from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnXToAngle:(double)angle;
// Rotation on X from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnXFromAngle:(double)fromAngle toAngle:(double)toAngle;
// Rotation on Y from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnYToAngle:(double)angle;
// Rotation on T from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnYFromAngle:(double)fromAngle toAngle:(double)toAngle;
// Rotation on Z from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnZToAngle:(double)angle;
// Rotation on Z from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnZFromAngle:(double)fromAngle toAngle:(double)toAngle;

// Presents a modalViewController with a flip animation
+ (void)presentModalViewControllerWithFlipAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;
// Presents a modalViewController with a partial curl animation
+ (void)presentModalViewControllerWithPartialCurlAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;
// Presents a modalViewController with a cross disolve animation
+ (void)presentModalViewControllerWithCrossDisolveAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;

// Wobble animation.
+ (void)startWobble:(UIView *)view;
+ (void)stopWobble:(UIView *)view;

+ (void)startJiggling:(UIView *)view;
+ (void)stopJiggling:(UIView *)view;

+ (void)startShakeAnimation:(UIView *)view;
+ (void)stopShakeAnimation:(UIView *)view;

+ (void)moveView:(UIView *)view withFrame:(CGRect)frame;
+ (void)moveView:(UIView *)view withPosition:(CGPoint)position;
+ (void)moveView:(UIView *)view withFrame:(CGRect)frame completion:(void (^)(BOOL finished))completion;
+ (void)moveView:(UIView *)view withPosition:(CGPoint)position completion:(void (^)(BOOL finished))completion;
@end
