//
//  Utils+Camera.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "Utils.h"

@interface Utils (Camera)
+ (BOOL)cameraAvailable;

+ (BOOL)cameraRearAvailable;

+ (BOOL)cameraFrontAvailable;

+ (BOOL)photoLibraryAvailable;

+ (BOOL)checkUseCanUsePhotoAlbum;
@end
