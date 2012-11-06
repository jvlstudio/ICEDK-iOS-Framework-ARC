//
//  ICEView+Utilities.h
//  ICEDK
//
//  Created by Icepat on 19/04/12.
//  Copyright (c) 2012 Icepat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Utilities)

// Get the size.
- (CGSize)size;
// Set the size.
- (void)setSize:(CGSize)size;
// Set the position on X and Y.
- (void)positionAtX:(double)positionX andY:(double)positionY;
// Set position.
- (void)setPosition:(CGPoint)position;
//Set centered anchor point, on point.
- (void)setPositionCenteredOnPoint:(CGPoint)position;
// Remove all the subviews.
- (void)removeSubviews;
// Check existing collision between point and rect.
- (BOOL)getCollisionOnViewWithPoint:(CGPoint)position;
// Render an UIImage from UIView.
- (UIImage *)renderImageFromView;
// Render an UIImage from UIView with a rect.
- (UIImage *)renderImageFromViewWithRect:(CGRect)frame;
// Get the touch position in the subview with the position in the parent view.
- (CGPoint)subViewGetPositionOfTouch:(CGPoint)touch;
// Get the the texture position of the touch.
- (CGPoint)getTexturePositionOfTouch:(CGPoint)touch withScale:(CGFloat)scale;
// Get the the view position of the texture position.
- (CGPoint)getViewPositionOfTexturePosition:(CGPoint)texturePosition withScale:(CGFloat)scale;

@end
