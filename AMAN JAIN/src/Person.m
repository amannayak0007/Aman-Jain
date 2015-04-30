//
//  Person.m
//  EBCardCollectionViewLayout
//
//  Created by Aman Jain on 15/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - Properties


#pragma mark - Public

- (instancetype) initWithDictionary:(NSDictionary *)aDictionary {
    
    self = [self init];
    
    if (self){
        
        self.name = aDictionary[@"name"];
        self.twitter = aDictionary[@"twitter"];
        self.avatarFilename = aDictionary[@"avatarFilename"];
        self.detail = aDictionary[@"detail"];
        self.subtitle = aDictionary[@"subtitle"];
        self.appdetail = aDictionary[@"appdetail"];
        self.link = aDictionary[@"link"];    }
    
   return self;
 }

@end
