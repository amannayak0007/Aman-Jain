//
//  AJCardCollectionView.h
//  Vindeo
//
//  Created by Aman Jain on 14/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AJCardCollectionView : UICollectionViewLayout

@property (readonly) NSInteger currentPage;
@property (nonatomic, assign) UIOffset offset;
@property (nonatomic, strong) NSDictionary *layoutInfo;
@end
