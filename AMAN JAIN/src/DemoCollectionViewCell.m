
//  Created by Aman Jain on 14/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//


#import "DemoCollectionViewCell.h"

#define kHorizontalOffset 10

@implementation DemoCollectionViewCell

#pragma mark - Properties

- (void)setPerson:(Person *)person {
    _person = person;
    _personImageView.image = [UIImage imageNamed:_person.avatarFilename];
    _personNameLabel.text = _person.name;
    _Subtitle.text = _person.subtitle;
    _Detail.text= _person.detail;
    _Link.text= _person.link;

}

@end
