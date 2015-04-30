//
//  Person.h
//  EBCardCollectionViewLayout
//
//  Created by Aman Jain on 15/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)aDictionary;

@property (strong) NSString *name;
@property (strong, nonatomic) NSString *twitter;
@property (strong) NSString *avatarFilename;
@property (strong,nonatomic) NSString *detail;
@property (strong,nonatomic) NSString *subtitle;
@property (strong,nonatomic) NSString *appdetail;
@property (strong,nonatomic) NSString *link;
@end
