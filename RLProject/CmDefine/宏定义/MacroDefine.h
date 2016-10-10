//
//  MacroDefine.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h

#if DEBUG
#define RLLog(xx, ...)                  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define RLLog(xx, ...)                  nil
#endif

///------
/// 生成单例的宏
///------

#define DEFINE_SINGLETON(className) \
\
+ (className *)getInstance;

#define IM_SINGLETON(className) \
\
+ (className *)getInstance { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


#define sleep(s);               [NSThread sleepForTimeInterval:s];
#define _(x)                    NSLocalizedString(x,@"")

#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH            [[UIScreen mainScreen] bounds].size.width

#define SCALE_WIDTH(__length)     round( SCREEN_WIDTH / 320.0 * __length )
#define SCALE_HEIGHT(__length)    round( SCREEN_HEIGHT / 568.0 * __length )
#define SCALE_WIDTH_6(__length)     round( SCREEN_WIDTH / 370.0 * __length )
#define SCALE_HEIGHT_6(__length)     round( SCREEN_HEIGHT / 667.0 * __length )
#define SCALE_RATE               1 - (1 - SCREEN_WIDTH / 375.0) / 1.5

#define RGBA(r,g,b,a)           [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)              [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define UIColorHex(_hex_)       [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define UIColorFromRGBV(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBVA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define kCustomFontName          @"Heiti SC"  //HYQiHei-EZJ， PingFang_SC_Regular  PingFangSC-Regular
#define fontWithSize(v)         [UIFont fontWithName:kCustomFontName size:v] //oldHelvetica

#define kAppDefaultColor        UIColorFromRGBV(0x3ec0f8)//整个APP蓝色 跟蓝色字体
#define kBGColor                UIColorFromRGBV(0xf7f7f8)//常用背景色(界面背景色)
#define kBGPlaceHolderColor     UIColorFromRGBV(0xe0e0e0)//占位图背景色
#define kGrayColor              UIColorFromRGBV(0xdedfe0)//分割线颜色、描边、提示字
#define kOrangeColor            UIColorFromRGBV(0xf37346)//橙色(提示、警示性文字)
//文字颜色
#define kBlackTextColor         UIColorFromRGBV(0x222222)//黑色文字(标题、内容性文字)
#define kBlueTextColor          UIColorFromRGBV(0x00baff)//蓝色文字
#define kDeepBlueTextColor      UIColorFromRGBV(0x2b4985)//深蓝色文字
#define kWhiteTextColor         UIColorFromRGBV(0xffffff)//白色文字
#define kLightWhiteTextColor    UIColorFromRGBV(0xc6f0ff)//浅白色文字
#define kTabTextColor           UIColorFromRGBV(0x666666)//底部标签文字
#define kGrayTextColor          UIColorFromRGBV(0x999999)//灰色文字
#define kLightGrayTextColor     UIColorFromRGBV(0x999999)//浅灰色文字(辅助性文字)
#define kTipTextColor           UIColorFromRGBV(0xcccccc)//提示字
#define kPressedCellColor       UIColorFromRGBV(0xe9ebed)// tableViewCell选中的颜色
//按钮
#define kCommonBtnBGColor           UIColorFromRGBV(0x00baff)//蓝色(默认颜色)
#define kCommonBtnTouchedBGColor    UIColorFromRGBV(0x5db9ff)//蓝色(点击颜色)
#define kCommonBtnDisableBGColor    UIColorFromRGBV(0xb4b4b4)//灰色(禁用颜色)
//字号
#define kFont19                 fontWithSize(19)//顶部导航栏标题
#define kFont18                 fontWithSize(18)//大按钮字体
#define kFont16                 fontWithSize(16)//大多数文字，正文，2级导航及项目名
#define kFont15                 fontWithSize(15)//少数叙述性内容文字
#define kFont14                 fontWithSize(14)//辅助性文字
#define kFont12                 fontWithSize(12)//底导文字及少数辅助性文字
#define kFont11                 fontWithSize(11)// 引导弹框文字
//布局
#define kCellSpacing            10.0
#define kCellHeight44           44.0
#define kCellSide               15.0
#define kNavBtnW                43.0
#define kNavBtnH                30.0
#define kBtnRadius              5.0
#define kSideMenuW              SCALE_WIDTH_6(80)
#define BADGE_SIZE 2.5  //红点大小
#define kTabBarHeight           49.0

//头像尺寸
#define COMMON_AVATAR_SIZE 180   //通用头像尺寸
#define COMMON_THUMB_SIZE 400   //通用九宫格图尺寸
#define COMMON_ORIGINAL_SIZE   [[UIScreen mainScreen] bounds].size.width * [UIScreen mainScreen].scale//1280   //大尺寸

#define COMMON_FEED_THUMB_SIZE      (SCREEN_WIDTH*kScreenScale)/3.0f    //社区九宫格图片尺寸的大小


#define kWeakSelf       weakify(self)
#define kStrongSelf     strongify(self)


//安全检查使用对象  add by zuoweijie
#define IsNOTNullOrEmptyOfArray(_ARRAY___) (_ARRAY___ && [_ARRAY___ isKindOfClass:[NSArray class]] && [_ARRAY___ count])
#define IsNOTNullOrEmptyOfDictionary(_DICTIONARY___) (_DICTIONARY___ && [_DICTIONARY___ isKindOfClass:[NSDictionary class]] && [_DICTIONARY___ count])
#define IsNOTNullOrEmptyOfNSString(_STRING___) (_STRING___ && [_STRING___ isKindOfClass:[NSString class]] && [_STRING___ length])
#define IsNOTNullOrEmptyOfNSNumber(_NUMBER___) (_NUMBER___ && [_NUMBER___ isKindOfClass:[NSNumber class]] )
#define IsNullObj(____object____) ((____object____ && [____object____ isKindOfClass: [NSNull class]]) || (____object____ == nil))
#define SafeToInitSomeString(_STRING__)  (( IsNOTNullOrEmptyOfNSString(_STRING__))?(_STRING__):@"")
#define SafeToInitSomeNSNumber(_NSNUMBER__)  (( IsNOTNullOrEmptyOfNSNumber(_NSNUMBER__))?(_NSNUMBER__):0)



//判断是否空字符串
#define isNullString(s)         (!s || [s isEqual:[NSNull null]] || [s isEqualToString:@""])
#define kNilOrNull(__ref) (((__ref) == nil) || ([(__ref) isEqual:[NSNull null]]))

#define delegateWindow               [[UIApplication sharedApplication].delegate window]

#define BAD_NETWORK     @"网络连接超时（网络已断开），请稍后重试"

#endif /* MacroDefine_h */
