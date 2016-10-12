//
//  Department+CoreDataProperties.h
//  RLProject
//
//  Created by yzl on 16/10/12.
//  Copyright © 2016年 RLProject. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Department.h"

NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *createDate;
@property (nullable, nonatomic, retain) NSString *departName;
@property (nullable, nonatomic, retain) NSSet<Employee *> *employee;

@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeeObject:(Employee *)value;
- (void)removeEmployeeObject:(Employee *)value;
- (void)addEmployee:(NSSet<Employee *> *)values;
- (void)removeEmployee:(NSSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
