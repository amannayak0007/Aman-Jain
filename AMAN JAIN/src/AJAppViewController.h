//
//  ViewController.h

//  Created by Aman Jain on 14/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "URBMediaFocusViewController.h"

@interface AJAppViewController : UIViewController  <URBMediaFocusViewControllerDelegate, UIGestureRecognizerDelegate,UICollectionViewDataSource>{
    NSMutableArray *_people;
    __weak IBOutlet UICollectionView *_collectionView;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end
