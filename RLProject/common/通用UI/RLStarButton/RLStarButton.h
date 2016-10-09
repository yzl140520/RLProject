//
//  RLStarButton.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLStarButton : UIControl
/**
 *  A bool value for button current status
 */
@property (nonatomic) BOOL isZan;
@property (strong, nonatomic) UILabel* o_titleLabel;    //标题

/**
 *  A handler for click button action
 */
@property (nonatomic, copy) void (^clickHandler)(RLStarButton *zanButton);

/**
 *  Initializes a new CatZanButton with appoint properties
 *
 *  @param frame      Button frame
 *  @param zanImage   Image for button active status
 *  @param unZanIamge Image for button inactive status
 *
 *  @return New CatZanButton object
 */
-(instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanIamge;
- (void)setTitleFont:(UIFont*)font;
- (void)setTitle:(NSString*)title;
@end
