//
//  ICECaptureDeviceInput+Utilities.h
//  P1
//
//  Created by Patrick Trillsam on 25/10/2012.
//  Copyright (c) 2012 P1. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface AVCaptureDeviceInput (Utilities)

// Check if there is multiple camera.
- (BOOL)hasMultipleCameras;
// Has flash.
- (BOOL)hasFlash;
// Get the current flash mode.
- (AVCaptureFlashMode)flashMode;
// Set the current flash mode.
- (void)setFlashMode:(AVCaptureFlashMode)flashMode;
// Has torch.
- (BOOL)hasTorch;
// Get the current torch mode.
- (AVCaptureTorchMode)torchMode;
// Set the current torch mode.
- (void)setTorchMode:(AVCaptureTorchMode)torchMode;
// Has focus.
- (BOOL)hasFocus;
// Get the current focus mode.
- (AVCaptureFocusMode)focusMode;
// Set the current focus mode.
- (void)setFocusMode:(AVCaptureFocusMode)focusMode;
// Set focus on point.
- (void)setFocusOnPoint:(CGPoint)point;
// Has exposure.
- (BOOL)hasExposure;
// Get the current exposure mode.
- (AVCaptureExposureMode)exposureMode;
// Set the current exposure mode.
- (void)setExposureMode:(AVCaptureExposureMode)exposureMode;
// Set exposure on point.
- (void)setExposureOnPoint:(CGPoint)point;
// Has white balance.
- (BOOL)hasWhiteBalance;
// Get the current white balance mode.
- (AVCaptureWhiteBalanceMode)whiteBalanceMode;
// Set the current white balance mode.
- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode;

@end
