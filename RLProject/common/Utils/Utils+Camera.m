//
//  Utils+Camera.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "Utils+Camera.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
@implementation Utils (Camera)
+ (BOOL)cameraAvailable
{
    BOOL ret = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    return ret;
}

+ (BOOL)cameraRearAvailable
{
    BOOL ret = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    return ret;
}

+ (BOOL)cameraFrontAvailable
{
    BOOL ret = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    return ret;
}

+ (BOOL)photoLibraryAvailable
{
    BOOL ret = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    return ret;
}

+ (BOOL)checkUseCanUsePhotoAlbum{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author ==ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限
        return NO;
    }
    return YES;
}
@end
