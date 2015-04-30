
//  Created by Aman Jain on 26/01/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Person.h"

@interface DemoCollectionViewCell : UICollectionViewCell {
    __weak IBOutlet UIImageView *_personImageView;
    __weak IBOutlet UILabel *_personNameLabel;
    __weak IBOutlet UILabel *_Subtitle;
    __weak IBOutlet UITextView *_Detail;
    __weak IBOutlet UITextView *_Link;
    
}
@property (weak, nonatomic) Person *person;
@end
