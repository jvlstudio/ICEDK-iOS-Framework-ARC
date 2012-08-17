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


// Clear and black horizontal gradient
+ (CAGradientLayer *)clearAndBlackHorizontalGradientWithFrame:(CGRect)frame isInverse:(BOOL)inverse;
// Clear and black vertical gradient
+ (CAGradientLayer *)clearAndBlackVerticalGradientWithFrame:(CGRect)frame isInverse:(BOOL)inverse;
// Horizontal gradient
+ (CAGradientLayer *)horizontalGradientWithFrame:(CGRect)frame color1:(UIColor *)color1 color2:(UIColor *)color2 isInverse:(BOOL)inverse;
// Vertical gradient
+ (CAGradientLayer *)verticalGradientWithFrame:(CGRect)frame color1:(UIColor *)color1 color2:(UIColor *)color2 isInverse:(BOOL)inverse;



// Presents a modalViewController with a flip animation
+ (void)presentModalViewControllerWithFlipAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;
// Presents a modalViewController with a partial curl animation
+ (void)presentModalViewControllerWithPartialCurlAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;
// Presents a modalViewController with a cross disolve animation
+ (void)presentModalViewControllerWithCrossDisolveAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController;

@end
