//
//  ICEAnimation.m
//  ICEDK
//
//  Created by Icepat on 21/05/12.
//  Copyright (c) 2012 Icepat. All rights reserved.
//

#import "ICEAnimation.h"
#import "ICEView+Utilities.h"

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

// Wobble animation.
+ (void)startWobble:(UIView *)view{
    view.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DEGREES_TO_RADIANS(-5));

    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse)
                     animations:^ {
                         view.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DEGREES_TO_RADIANS(5));
                     }
                     completion:NULL
     ];
}

+ (void)stopWobble:(UIView *)view{
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear)
                     animations:^ {
                         view.transform = CGAffineTransformIdentity;
                     }
                     completion:NULL
     ];
}

//+ (void)startJiggling:(UIView *)view{
//    NSInteger count = 3;
//    double kAnimationRotateDeg = (double)(arc4random()%5 + 5) / 10;
//    double kAnimationTranslateX = (arc4random()%4);
//    double kAnimationTranslateY = (arc4random()%4);
//
//    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS( kAnimationRotateDeg * (count%2 ? +1 : -1 ) ));
//    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS( kAnimationRotateDeg * (count%2 ? -1 : +1 ) ));
//    int leftOrRight = (arc4random()%2);
//    if (leftOrRight == 0){
//        CGAffineTransform moveTransform = CGAffineTransformTranslate(rightWobble, -kAnimationTranslateX, -kAnimationTranslateY);
//        CGAffineTransform conCatTransform = CGAffineTransformConcat(rightWobble, moveTransform);
//        view.transform = leftWobble;  // starting point
//
//        [UIView animateWithDuration:0.1
//                              delay:(count * 0.08)
//                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
//                         animations:^{ view.transform = conCatTransform; }
//                         completion:nil];
//    } else if (leftOrRight == 1) {
//        CGAffineTransform moveTransform = CGAffineTransformTranslate(leftWobble, -kAnimationTranslateX, -kAnimationTranslateY);
//        CGAffineTransform conCatTransform = CGAffineTransformConcat(leftWobble, moveTransform);
//        view.transform = rightWobble;  // starting point
//
//        [UIView animateWithDuration:0.1
//                              delay:(count * 0.08)
//                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
//                         animations:^{ view.transform = conCatTransform; }
//                         completion:nil];
//    }
//}
//
//+ (void)stopJiggling:(UIView *)view{
//    [view.layer removeAllAnimations];
//    view.transform = CGAffineTransformIdentity;  // Set it straight
//}
//#define degreesToRadians(x) (M_PI * (x) / 180.0)
//#define kAnimationRotateDeg 1.0
//#define kAnimationTranslateX 2.0
//#define kAnimationTranslateY 2.0


#define kAnimationRotateDeg 6.0
#define kAnimationTranslateX 1.0
#define kAnimationTranslateY 2.0

+ (void)startJiggling:(UIView *)view{
    int i = 1;
[UIView animateWithDuration:0.25
                      delay:0.0
                    options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat
                 animations:^{
                     view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, kAnimationTranslateX, kAnimationTranslateY);
                     view.transform = CGAffineTransformMakeRotation(kAnimationRotateDeg*(i%2 ? -1 : +1)*(3.141519/180.0));
                 }
                 completion:^(BOOL finished){
                     [UIView animateWithDuration:0.25
                                           delay:0.0
                                         options:UIViewAnimationOptionAllowUserInteraction
                                      animations:^{
                                          view.transform = CGAffineTransformTranslate(view.transform, -kAnimationTranslateX, -kAnimationTranslateY);
                                          view.transform = CGAffineTransformMakeRotation(-kAnimationRotateDeg*(i%2 ? +1 : -1)*(3.141519/180.0));
                                      }
                                      completion:nil];							   
                 }];
}

//+ (void)startJiggling:(UIView *)view{
//    NSInteger count = 3;
//    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(degreesToRadians( kAnimationRotateDeg * (count%2 ? +1 : -1 ) ));
//    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(degreesToRadians( kAnimationRotateDeg * (count%2 ? -1 : +1 ) ));
//    CGAffineTransform moveTransform = CGAffineTransformTranslate(rightWobble, -kAnimationTranslateX, -kAnimationTranslateY);
//    CGAffineTransform conCatTransform = CGAffineTransformConcat(rightWobble, moveTransform);
//
//    view.transform = leftWobble;  // starting point
//
//    [UIView animateWithDuration:0.1
//                          delay:(count * 0.08)
//                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
//                     animations:^{ view.transform = conCatTransform; }
//                     completion:nil];
//}

+ (void)stopJiggling:(UIView *)view{
    [view.layer removeAllAnimations];
    view.transform = CGAffineTransformIdentity;  // Set it straight
}

#define Y_OFFSET 2.0f
#define X_OFFSET 2.0f
#define ANIMATION_SPEED 2.0f
#define ANGLE_OFFSET (M_PI_4*0.1f)

+ (void)startShakeAnimation:(UIView *)view{
    CFTimeInterval offset = (double)arc4random()/(double)RAND_MAX;
    view.transform = CGAffineTransformRotate(view.transform, -ANGLE_OFFSET*0.5);
    view.transform = CGAffineTransformTranslate(view.transform, -X_OFFSET*0.5f, -Y_OFFSET*0.5f);

    CABasicAnimation *tAnim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    tAnim.repeatCount = HUGE_VALF;
    tAnim.byValue = [NSNumber numberWithFloat:X_OFFSET];
    tAnim.duration = 0.07f * ANIMATION_SPEED;
    tAnim.autoreverses = YES;
    tAnim.timeOffset = offset;
    [view.layer addAnimation:tAnim forKey:@"shake_translation_x"];

    CABasicAnimation *tyAnim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    tyAnim.repeatCount = HUGE_VALF;
    tyAnim.byValue = [NSNumber numberWithFloat:Y_OFFSET];
    tyAnim.duration = 0.06f * ANIMATION_SPEED;
    tyAnim.autoreverses=YES;
    tyAnim.timeOffset=offset;
    [view.layer addAnimation:tyAnim forKey:@"shake_translation_y"];

    CABasicAnimation *rAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rAnim.repeatCount = HUGE_VALF;
    rAnim.byValue = [NSNumber numberWithFloat:ANGLE_OFFSET];
    rAnim.duration = 0.15f * ANIMATION_SPEED;
    rAnim.autoreverses = YES;
    rAnim.timeOffset = offset;
    [view.layer addAnimation:rAnim forKey:@"shake_rotation"];
}

+ (void)stopShakeAnimation:(UIView *)view{
    [view.layer removeAnimationForKey:@"shake_translation_x"];
    [view.layer removeAnimationForKey:@"shake_translation_y"];
    [view.layer removeAnimationForKey:@"shake_rotation"];
    [UIView animateWithDuration:0.2f animations:^{
        view.transform = CGAffineTransformRotate(view.transform, ANGLE_OFFSET*0.5);
        view.transform = CGAffineTransformTranslate(view.transform, X_OFFSET*0.5, Y_OFFSET*0.5f);
    }];
}

+ (void)fadeView:(UIView *)view toValue:(CGFloat)value{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^ {
                         [view setAlpha:value];
                     }
                     completion:nil
     ];
}

+ (void)fadeLayer:(CALayer *)layer fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	[animation setFillMode:kCAFillModeForwards];
	[animation setRemovedOnCompletion:NO];
    [animation setDuration:0.4];
    [animation setFromValue:[NSNumber numberWithFloat:fromValue]];
    [animation setToValue:[NSNumber numberWithFloat:toValue]];
    [layer addAnimation:animation forKey:@"shake_rotation"];    
}

+ (void)moveView:(UIView *)view withFrame:(CGRect)frame{
    [self moveView:view withFrame:frame completion:NULL];
}

+ (void)moveView:(UIView *)view withPosition:(CGPoint)position{
    [self moveView:view withPosition:position completion:NULL];    
}

+ (void)moveView:(UIView *)view withFrame:(CGRect)frame completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^ {
                         [view setFrame:frame];
                     }
                     completion:completion
     ];
}

+ (void)moveView:(UIView *)view withPosition:(CGPoint)position completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^ {
                         [view setPosition:position];
                     }
                     completion:completion
     ];
}


@end
