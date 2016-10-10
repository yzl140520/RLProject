//
//  GetShoolDetailInfo.h
//  RLProject
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLRequest.h"

@interface GetShoolDetailInfo : RLRequest

- (instancetype)initWithSchoolId:(NSString*)schoolId;
@end
