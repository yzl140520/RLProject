//
//  RLCopyLabel.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLCopyLabel.h"
@interface RLCopyLabel()
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief 长按block
 */
@property (copy, nonatomic) void(^longPressBlock)(RLCopyLabel* copyLabel);
@end
@implementation RLCopyLabel

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
        //        [self addNotification];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self attachTapHandler];
        //        [self addNotification];
        
    }
    return self;
}
- (void)dealloc{
    //    [self removeNotification];
}
-(BOOL)canBecomeFirstResponder

{
    
    return YES;
    
}

// 可以响应的方法

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender

{
    return (action == @selector(copy:));
}

//针对于响应方法的实现

-(void)copy:(id)sender

{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    [self selectContent:NO];
    
}
-(void)attachTapHandler

{
    
    self.userInteractionEnabled = YES;  //用户交互的总开关
    
    UILongPressGestureRecognizer*touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:touch];
    //    UITapGestureRecognizer* tapGst = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    //    [self addGestureRecognizer:tapGst];
}
- (void)tapAction:(UITapGestureRecognizer*)tapGst{
    [self selectContent:NO];
}
-(void)longPress:(UIGestureRecognizer*) recognizer

{
    [self becomeFirstResponder];
    [self selectContent:YES];
    if (recognizer.state == UIGestureRecognizerStateBegan ) {
        //        CGRect rect = self.frame;
        //        CGRect strRect    = [self.attributedText boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine) context:nil];
        //        CGFloat width     = CGRectGetWidth(strRect)/2.0;
        //        rect.size.width   = width * 2;
        //        [[UIMenuController sharedMenuController] setTargetRect:rect inView:self.superview];
        //
        //        [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
        if (self.longPressBlock) {
            self.longPressBlock(self);
        }
    }
}
- (void)selectContent:(BOOL)isSelected{
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    if (!str || str.length <= 0) {
        return;
    }
    if (isSelected) {
        [str addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:0.733 green:0.733 blue:0.722 alpha:1.000] range:NSMakeRange(0, str.length)];
    }else{
        [str addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, str.length)];
    }
    self.attributedText = str;
}
//- (void)addNotification{
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menuDisappear:) name:UIMenuControllerDidHideMenuNotification object:nil];
//}
//- (void)removeNotification{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//- (void)menuDisappear:(NSNotification*)notification{
//    [self selectContent:NO];
//}
#pragma mark - publich method
- (void)addLongPressBlock:(void (^)(RLCopyLabel *))block{
    self.longPressBlock = block;
    
}


@end
