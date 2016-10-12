//
//  Employee+CoreDataProperties.h
//  RLProject
//
//  Created by yzl on 16/10/12.
//  Copyright © 2016年 RLProject. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *birthday;
@property (nullable, nonatomic, retain) NSNumber *height;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *sectionName;
@property (nullable, nonatomic, retain) NSManagedObject *department;

@end

NS_ASSUME_NONNULL_END
