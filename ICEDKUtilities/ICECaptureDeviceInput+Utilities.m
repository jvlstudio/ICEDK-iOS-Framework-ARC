//
//  ICECaptureSession+Utilities.m
//  P1
//
//  Created by Patrick Trillsam on 25/10/2012.
//  Copyright (c) 2012 P1. All rights reserved.
//

#import "ICECaptureDeviceInput+Utilities.h"

@implementation AVCaptureDeviceInput (Utilities)

#pragma mark - Hardware access management
// Check if there is multiple camera.
- (BOOL)hasMultipleCameras{
    return [[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count] > 1 ? YES : NO;
}

// Has flash.
- (BOOL)hasFlash{
    return [[self device] hasFlash];
}

// Get the current flash mode.
- (AVCaptureFlashMode)flashMode{
    return [[self device] flashMode];
}

// Set the current flash mode.
- (void)setFlashMode:(AVCaptureFlashMode)flashMode{
    AVCaptureDevice *device = [self device];
    if ([device isFlashModeSupported:flashMode] && [device flashMode] != flashMode) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setFlashMode:flashMode];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Has torch.
- (BOOL)hasTorch{
    return [[self device] hasTorch];
}

// Get the current torch mode.
- (AVCaptureTorchMode)torchMode{
    return [[self device] torchMode];
}

// Set the current torch mode.
- (void)setTorchMode:(AVCaptureTorchMode)torchMode{
    AVCaptureDevice *device = [self device];
    if ([device isTorchModeSupported:torchMode] && [device torchMode] != torchMode) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setTorchMode:torchMode];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Has focus.
- (BOOL)hasFocus{
    AVCaptureDevice *device = [self device];

    return  [device isFocusModeSupported:AVCaptureFocusModeLocked] ||
    [device isFocusModeSupported:AVCaptureFocusModeAutoFocus] ||
    [device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus];
}

// Get the current focus mode.
- (AVCaptureFocusMode)focusMode{
    return [[self device] focusMode];
}

// Set the current focus mode.
- (void)setFocusMode:(AVCaptureFocusMode)focusMode{
    AVCaptureDevice *device = [self device];
    if ([device isFocusModeSupported:focusMode] && [device focusMode] != focusMode) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setFocusMode:focusMode];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Set focus on point.
- (void)setFocusOnPoint:(CGPoint)point{
    AVCaptureDevice *device = [self device];

    if ([device isFocusPointOfInterestSupported] && [device isFocusModeSupported:AVCaptureFocusModeAutoFocus]) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setFocusPointOfInterest:point];
            [device setFocusMode:AVCaptureFocusModeAutoFocus];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Has exposure.
- (BOOL)hasExposure{
    AVCaptureDevice *device = [self device];

    return  [device isExposureModeSupported:AVCaptureExposureModeLocked] ||
    [device isExposureModeSupported:AVCaptureExposureModeAutoExpose] ||
    [device isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure];
}

// Get the current exposure mode.
- (AVCaptureExposureMode)exposureMode{
    return [[self device] exposureMode];
}

// Set the current exposure mode.
- (void)setExposureMode:(AVCaptureExposureMode)exposureMode{
    if (exposureMode == 1) {
        exposureMode = 2;
    }
    AVCaptureDevice *device = [self device];
    if ([device isExposureModeSupported:exposureMode] && [device exposureMode] != exposureMode) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setExposureMode:exposureMode];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Set exposure on point.
- (void)setExposureOnPoint:(CGPoint)point{
    AVCaptureDevice *device = [self device];
    if ([device isExposurePointOfInterestSupported] && [device isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure]) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setExposurePointOfInterest:point];
            [device setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}

// Has white balance.
- (BOOL)hasWhiteBalance{
    AVCaptureDevice *device = [self device];

    return  [device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeLocked] ||
    [device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance];
}

// Get the current white balance mode.
- (AVCaptureWhiteBalanceMode)whiteBalanceMode{
    return [[self device] whiteBalanceMode];
}

// Set the current white balance mode.
- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode
{
    if (whiteBalanceMode == 1) {
        whiteBalanceMode = 2;
    }
    AVCaptureDevice *device = [self device];
    if ([device isWhiteBalanceModeSupported:whiteBalanceMode] && [device whiteBalanceMode] != whiteBalanceMode) {
        NSError *error;
        if ([device lockForConfiguration:&error]) {
            [device setWhiteBalanceMode:whiteBalanceMode];
            [device unlockForConfiguration];
        } else {
            NSLog(@"Failed to get lock on APN configuration %@", error);
        }
    }
}


@end
