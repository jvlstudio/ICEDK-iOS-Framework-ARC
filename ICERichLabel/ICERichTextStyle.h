//
//  ICERichTextStyle.h
//  ICEDK
//
//  Created by Icepat on 27/04/12.
//  Copyright (c) 2012 Icepat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICERichTextStyle : NSObject {
    // Define a text style, based on font, color...
	UIFont *font_;
	UIColor *color_;	
    UIColor *backgroundColor_;
    NSString *prefix_;
    
    // Hidden prefix when on screen.
    BOOL prefixIsHidden_;
    
    // Target & action.
	id __unsafe_unretained target_;
	SEL action_;
}

@property (nonatomic) UIFont *font;
@property (nonatomic) UIColor *color;
@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) NSString *prefix;
@property (nonatomic, unsafe_unretained) BOOL prefixIsHidden;
@property (unsafe_unretained, nonatomic, readonly) id target;
@property (nonatomic, readonly) SEL action;

// Define the style.
+ (ICERichTextStyle*)styleWithFont:(UIFont*)font
                             color:(UIColor*)color
                         backColor:(UIColor*)backgroundColor
                            prefix:(NSString*)prefix
                        hidePrefix:(BOOL)enabled;
// Define the style with the target and action.
+ (ICERichTextStyle*)styleWithFont:(UIFont*)font
                             color:(UIColor*)color
                         backColor:(UIColor*)backgroundColor
                            prefix:(NSString*)prefix
                        hidePrefix:(BOOL)enabled
                            target:(id)target
                         andAction:(SEL)action;
// Set or change the target and action.
- (void)addTarget:(id)target action:(SEL)action;

@end