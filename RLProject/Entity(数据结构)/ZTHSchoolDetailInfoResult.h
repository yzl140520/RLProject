//
//  ZTHSchoolDetailInfoResult.h
//  ztjyyd
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SchoolDetailInfo;
@class ModulInfo;
@class SchoolDetailInfoSummary;

@interface SchoolDetailInfoResult : NSObject
@property (nonatomic, assign) NSInteger returncode;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) SchoolDetailInfoSummary* body;
@end



@interface SchoolDetailInfoSummary : NSObject
@property(strong,nonatomic)NSString* o_teacherType;//教师类型 老师：teacher 园丁：leader
@property(strong,nonatomic)SchoolDetailInfo* o_schoolDetailInfo;//学校信息
@property(strong,nonatomic)NSMutableArray<ModulInfo*>* o_moduleList;//学校所开放的功能模块
@property(assign,nonatomic)NSInteger o_schoolType;  //学校类型 1-正常、2-家长演示、3-园长演示(家长端、园丁端只要是2就提示)
@property(assign,nonatomic)NSInteger isregisterteacher;//1-报名老师； 0不是报名老师
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 方案版本号
 */
@property (strong, nonatomic) NSString* o_docVersion;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 行业类名
 */
@property (strong, nonatomic) NSString* o_industryName;

/*
 * IM服务提供者(0-服务器判断失败，请调用1306协议来判断. 1-环信 2-腾讯云通信)注:无学校ID时也返回0
 */
@property (assign,nonatomic) NSInteger imProvider;


@end

@interface SchoolDetailInfo: NSObject
@property(strong,nonatomic)NSString* o_schoolId;//学校id
@property(strong,nonatomic)NSString* o_schoolName;//学校名称
@property(strong,nonatomic)NSString* o_schoolLogo;//学校logo地址
@property(strong,nonatomic)NSString* o_schoolTelphone;//学校的电话号码
@property(strong,nonatomic)NSString* defaultpwd;//学校的默认密码

/*
 *必填(潜在园相关)[原1302合并]	0:审核中 1:被拒
 */
@property (assign,nonatomic) NSInteger status;
/*
 * 选填(潜在园相关) [原1302合并]	代理商姓名(被拒时)
 */
@property (strong,nonatomic) NSString* agentName;
/*
 * 选填(潜在园相关) [原1302合并]	代理商电话(被拒时)
 */
@property (strong,nonatomic) NSString* agentphone;
@end

@interface ModulInfo : NSObject
@property(strong,nonatomic)NSString* o_mId;           //功能模块ID
@property(strong,nonatomic)NSString* o_mName;         //功能模块名称
@property(assign,nonatomic)NSInteger o_isExp;         //是否到期（1：是 0:否）

/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief 模块状态：1-可正常使用 2-版本过低，但是仍可使用，客户端可做提示 3-模块不可用，需要提示用户升级。
 */
@property (assign, nonatomic) NSInteger moudelState;
@end