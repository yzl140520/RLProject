//
//  RLCopyLabel.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLCopyLabel : UILabel

/*!
 *  @author yzl, 16-03-08 14:03:30
 *
 *  @brief 长按block
 *
 *  @param block block description
 */
- (void)addLongPressBlock:(void(^)(RLCopyLabel* copyLabel))block;
/*!
 *  @author yzl, 16-03-08 14:03:47
 *
 *  @brief 是否选中内容
 *
 *  @param isSelected isSelected description
 */
- (void)selectContent:(BOOL)isSelected;
@end
