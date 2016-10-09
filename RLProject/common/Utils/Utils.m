//
//  Utils.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (CGSize)stringSizeWithString:(NSString *)string font:(CGFloat)labelFont{
    CGSize titleSize;
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string
                                                                             attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:labelFont]}];
        CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        titleSize = rect.size;
    }
    return titleSize;
}
@end
