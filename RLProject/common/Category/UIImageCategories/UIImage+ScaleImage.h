//
//  UIImage+ScaleImage.h
//  ztjy
//
//  Created by apple on 6/29/15.
//  Copyright (c) 2015 jimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleImage)
-(UIImage*)scaleToSize:(CGSize)size;

- (UIImage *)imageByScalingToSize:(CGSize)size;
@end
