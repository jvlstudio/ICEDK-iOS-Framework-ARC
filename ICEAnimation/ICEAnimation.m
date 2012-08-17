//
//  ICEAnimation.m
//  ICEDK
//
//  Created by Icepat on 21/05/12.
//  Copyright (c) 2012 Icepat. All rights reserved.
//

#import "ICEAnimation.h"

@implementation ICEAnimation
    
#pragma mark - Transparency Animation
// Transparency automatic.
+ (CABasicAnimation*)transparencyAnimation{
    return [self transparencyAnimationFromValue:1.0f toValue:0.2f];
}

// Transparency manual.
+ (CABasicAnimation*)transparencyAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];    
    [animation setFromValue:[NSNumber numberWithFloat:fromValue]];
    [animation setToValue:[NSNumber numberWithFloat:toValue]];
    return animation;
}

#pragma mark - Translate Animation
// Translate manual.
+ (CABasicAnimation*)translateAnimationFrom:(CGPoint)fromValue to:(CGPoint)toValue{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];
    [animation setFromValue:[NSValue valueWithCGPoint:fromValue]];
    [animation setToValue:[NSValue valueWithCGPoint:toValue]];
    return animation;
}

#pragma mark - Rotation Animation
// Rotation on X from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnXToAngle:(double)angle{
    return [self rotateAnimationOnXFromAngle:0 toAngle:angle];
}

// Rotation on X from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnXFromAngle:(double)fromAngle toAngle:(double)toAngle{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];    
    [animation setFromValue:[NSNumber numberWithDouble:fromAngle*M_PI/180]];
    [animation setToValue:[NSNumber numberWithDouble:toAngle*M_PI/180]];
    return animation;
}

// Rotation on Y from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnYToAngle:(double)angle{
    return [self rotateAnimationOnYFromAngle:0 toAngle:angle];
}

// Rotation on Y from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnYFromAngle:(double)fromAngle toAngle:(double)toAngle{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];    
    [animation setFromValue:[NSNumber numberWithDouble:fromAngle*M_PI/180]];
    [animation setToValue:[NSNumber numberWithDouble:toAngle*M_PI/180]];
    return animation;
}

// Rotation on Z from 0 to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnZToAngle:(double)angle{
    return [self rotateAnimationOnZFromAngle:0 toAngle:angle];
}

// Rotation on Z from ANGLE to ANGLE.
+ (CABasicAnimation*)rotateAnimationOnZFromAngle:(double)fromAngle toAngle:(double)toAngle{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];    
    [animation setFromValue:[NSNumber numberWithDouble:fromAngle*M_PI/180]];
    [animation setToValue:[NSNumber numberWithDouble:toAngle*M_PI/180]];
    return animation;
}

// Clear and black horizontal gradient
+ (CAGradientLayer *)clearAndBlackHorizontalGradientWithFrame:(CGRect)frame isInverse:(BOOL)inverse
{
	return [self horizontalGradientWithFrame:frame color1:[UIColor clearColor] color2:[UIColor blackColor] isInverse:inverse];
}
// Clear and black vertical gradient
+ (CAGradientLayer *)clearAndBlackVerticalGradientWithFrame:(CGRect)frame isInverse:(BOOL)inverse
{
	return [self verticalGradientWithFrame:frame color1:[UIColor clearColor] color2:[UIColor blackColor] isInverse:inverse];
}

// Horizontal gradient
+ (CAGradientLayer *)horizontalGradientWithFrame:(CGRect)frame color1:(UIColor *)color1 color2:(UIColor *)color2 isInverse:(BOOL)inverse
{
	NSArray *colors = [NSArray arrayWithObjects:(__bridge id)[color1 CGColor], (__bridge id)[color2 CGColor], nil];

	CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
	[gradientLayer setColors:colors];
	[gradientLayer setFrame:frame];

	if (!inverse) {
		[gradientLayer setStartPoint:CGPointMake(0.0, 0.5)];
		[gradientLayer setEndPoint:CGPointMake(1.0, 0.5)];
	}
	else {
		[gradientLayer setStartPoint:CGPointMake(1.0, 0.5)];
		[gradientLayer setEndPoint:CGPointMake(0.0, 0.5)];
	}
	return gradientLayer;
}

// Vertical gradient
+ (CAGradientLayer *)verticalGradientWithFrame:(CGRect)frame color1:(UIColor *)color1 color2:(UIColor *)color2 isInverse:(BOOL)inverse
{
	NSArray *colors = [NSArray arrayWithObjects:(__bridge id)[color1 CGColor], (__bridge id)[color2 CGColor], nil];

	CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
	[gradientLayer setColors:colors];
	[gradientLayer setFrame:frame];

	if (!inverse) {
		[gradientLayer setStartPoint:CGPointMake(0.5, 0.0)];
		[gradientLayer setEndPoint:CGPointMake(0.5, 1.0)];
	}
	else {
		[gradientLayer setStartPoint:CGPointMake(0.5, 1.0)];
		[gradientLayer setEndPoint:CGPointMake(0.5, 0.0)];
	}
	return gradientLayer;
}


// Presents a modalViewController with a flip animation
+ (void)presentModalViewControllerWithFlipAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController
{
	modalViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[rootViewController presentModalViewController:modalViewController animated:YES];
}

// Presents a modalViewController with a flip animation
+ (void)presentModalViewControllerWithPartialCurlAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController
{
	modalViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
	[rootViewController presentModalViewController:modalViewController animated:YES];
}

// Presents a modalViewController with a cross disolve animation
+ (void)presentModalViewControllerWithCrossDisolveAnimation:(UIViewController *)rootViewController andModalViewController:(UIViewController *)modalViewController
{
	modalViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[rootViewController presentModalViewController:modalViewController animated:YES];
}


@end
