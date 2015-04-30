//
//  AJViewSecond.h
//  Aman Jain
//
//  Created by Aman Jain on 16/04/15.
//  Copyright (c) 2014 aman. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

@interface AJViewSecond : UIViewController

{
    CFURLRef		soundFileURLRef;
    SystemSoundID	soundFileObject;
}

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *socialImageView;
@property (weak, nonatomic) IBOutlet UIImageView *SkillsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *AppImageView;

@property (readwrite)	CFURLRef		soundFileURLRef;
@property (readonly)	SystemSoundID	soundFileObject;

@end
