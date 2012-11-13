//
//  ICEView+Utilities.m
//  ICEDK
//
//  Created by Icepat on 19/04/12.
//  Copyright (c) 2012 Icepat. All rights reserved.
//

#import "ICEView+Utilities.h"

@implementation UIView (Utilities)

// Get the size.
- (CGSize)size{
	CGRect frame = [self frame];
	return frame.size;
}

// Set the size.
- (void)setSize:(CGSize)size{
	CGRect frame = [self frame];
	frame.size.width = round(size.width);
	frame.size.height = round(size.height);
	[self setFrame:frame];
}

// Set the position on X and Y.
- (void)positionAtX:(double)positionX andY:(double)positionY{
	CGRect frame = [self frame];
	frame.origin.x = round(positionX);
	frame.origin.y = round(positionY);
	[self setFrame:frame];
}

- (void)translateWithVector:(CGPoint)position{
    CGRect frame = [self frame];
    frame.origin.x = round(frame.origin.x + position.x);
    frame.origin.y = round(frame.origin.y + position.y);
    [self setFrame:frame];
}

// Set position.
- (void)setPosition:(CGPoint)position{
    [self positionAtX:position.x andY:position.y];
}

//Set centered anchor point, on point.
- (void)setPositionCenteredOnPoint:(CGPoint)position{
   [self positionAtX:(position.x - self.frame.size.width / 2) andY:(position.y - self.frame.size.height / 2)];
}

// Remove all the subviews.
- (void)removeSubviews{
	for(UIView *view in self.subviews) {
		[view removeFromSuperview];
	}
}

// Check existing collision between point and rect.
- (BOOL)getCollisionOnViewWithPoint:(CGPoint)position{
    CGSize targetSize = self.frame.size;
    CGPoint targetPosition = self.frame.origin;

    // Collision detected.
    if (![self isHidden])
        if ((position.x > targetPosition.x) && (position.x < (targetPosition.x + targetSize.width)))
            if ((position.y > targetPosition.y) && (position.y < (targetPosition.y + targetSize.height)))
                return YES;

    // No touch on view.
    return NO;
}

// Render an UIImage from UIView.
- (UIImage *)renderImageFromView{
	return [self renderImageFromViewWithRect:self.bounds];
}

// Render an UIImage from UIView with a rect.
- (UIImage *)renderImageFromViewWithRect:(CGRect)frame{
    // Create a new context of the desired size to render the image
	UIGraphicsBeginImageContextWithOptions(frame.size, YES, 0);
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Translate it, to the desired position
	CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
    
    // Render the view as image
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // Fetch the image   
    UIImage *renderedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Cleanup
    UIGraphicsEndImageContext();
    
    return renderedImage;
}

// Get the touch position in the subview with the position in the parent view.
- (CGPoint)subViewGetPositionOfTouch:(CGPoint)touch{
    CGPoint position = CGPointMake(touch.x - self.frame.origin.x, touch.y - self.frame.origin.y);
    if (position.x < 0)
        position.x = 0;
    else if (position.x > self.frame.size.width)
        position.x = self.frame.size.width;

    if (position.y < 0)
        position.y = 0;
    else if (position.y > self.frame.size.height)
        position.y = self.frame.size.height;

    return position;
}

// Get the the texture position of the touch.
- (CGPoint)getTexturePositionOfTouch:(CGPoint)touch withScale:(CGFloat)scale{
    return CGPointMake((touch.x / self.frame.size.width) * scale, (touch.y / self.frame.size.height) * scale);
}

// Get the the view position of the texture position.
- (CGPoint)getViewPositionOfTexturePosition:(CGPoint)texturePosition withScale:(CGFloat)scale{
    return CGPointMake((texturePosition.x * self.frame.size.width) * scale, (texturePosition.y * self.frame.size.height) * scale);
}


@end
