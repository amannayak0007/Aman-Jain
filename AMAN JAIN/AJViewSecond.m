//
//  AJViewSecond.m
//  Aman Jain
//
//  Created by Aman Jain on 16/04/15.
//  Copyright (c) 2014 aman. All rights reserved.
//

#import "AJViewSecond.h"
#import "AMAN_JAIN-Swift.h"

@interface AJViewSecond ()
@property (weak, nonatomic) IBOutlet SpringView *SpringView2;
@property (weak, nonatomic) IBOutlet SpringView *SpringView3;
@property (weak, nonatomic) IBOutlet SpringView *SpringView4;
@property (weak, nonatomic) IBOutlet SpringView *SpringView5;
@property (weak, nonatomic) IBOutlet SpringImageView *SpringImage2;
@property (weak, nonatomic) IBOutlet SpringImageView *SpringImage3;
@property (weak, nonatomic) IBOutlet SpringImageView *SpringImage4;
@property (weak, nonatomic) IBOutlet SpringLabel *SpringLabel1;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) NSArray *textValues;

@end

@implementation AJViewSecond

@synthesize SpringView2;
@synthesize SpringView3;
@synthesize SpringView4;
@synthesize SpringView5;
@synthesize SpringImage2;
@synthesize SpringImage3;
@synthesize SpringImage4;
@synthesize SpringLabel1;
@synthesize soundFileURLRef;
@synthesize soundFileObject;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _idx = 0;
    _textValues = @[
                    @"Shake 📱 To Get It",
                    @"You Left Something Inside",
                    @"Something Special For You"
                    ];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width /2;
    self.profileImageView.layer.borderWidth = 2.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImageView.clipsToBounds = YES;
    
    self.SkillsImageView.layer.cornerRadius = self.SkillsImageView.frame.size.width /2;
    self.SkillsImageView.layer.borderWidth = 2.0f;
    self.SkillsImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.SkillsImageView.clipsToBounds = YES;

    self.socialImageView.layer.cornerRadius = self.socialImageView.frame.size.width /2;
    self.socialImageView.layer.borderWidth = 2.0f;
    self.socialImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.socialImageView.clipsToBounds = YES;

    self.AppImageView.layer.cornerRadius = self.AppImageView.frame.size.width /2;
    self.AppImageView.layer.borderWidth = 2.0f;
    self.AppImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.AppImageView.clipsToBounds = YES;

    
    //Spring View Animation.
    
    SpringView2.animation = @"fadeInUp";
    SpringView2.curve = @"spring";
    SpringView2.force = 0.5;
    SpringView2.delay = 0;
    SpringView2.duration = 2.0;
    SpringView2.autostart = true;
    
    SpringView3.animation = @"fadeInUp";
    SpringView3.curve = @"spring";
    SpringView3.force = 0.5;
    SpringView3.delay = 0.2;
    SpringView3.duration = 2.0;
    SpringView3.autostart = true;
    
    SpringView4.animation = @"fadeInUp";
    SpringView4.curve = @"spring";
    SpringView4.force = 0.5;
    SpringView4.delay = 0.4;
    SpringView4.duration = 2.0;
    SpringView4.autostart = true;
    
    SpringView5.animation = @"fadeInUp";
    SpringView5.curve = @"spring";
    SpringView5.force = 0.5;
    SpringView5.delay = 0.6;
    SpringView5.duration = 2.0;
    SpringView5.autostart = true;
    
    //SpringImageView Animation.
    
    SpringImage2.animation = @"shake";
    SpringImage2.curve = @"spring";
    SpringImage2.force = 1.0;
    SpringImage2.delay = 0;
    SpringImage2.duration = 3.0;
    SpringImage2.autostart = true;
    
    SpringImage4.animation = @"fadeInUp";
    SpringImage4.image = [UIImage imageNamed:@"cloud.png"];
    SpringImage4.curve = @"spring";
    SpringImage4.force = 1.0;
    SpringImage4.delay = 2;
    SpringImage4.duration = 3.0;
    SpringImage4.autostart = true;
    
    [self toggleText];
    
    NSURL *MagicSound   = [[NSBundle mainBundle] URLForResource: @"sound-magic"
                                                withExtension: @"wav"];
    
    // Store the URL as a CFURLRef instance.
    self.soundFileURLRef = (__bridge CFURLRef) MagicSound;
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID (
                                      
                                      soundFileURLRef,
                                      &soundFileObject
                                      );
}

//ShakeGesture Recongniz.

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        
        //SpringImageView Animation.
        
        SpringImage3.animation = @"fadeInUp";
        SpringImage3.image = [UIImage imageNamed:@"AppleStickers.png"];
        SpringImage3.curve = @"linear";
        SpringImage3.force = 1.0;
        SpringImage3.delay = 0;
        SpringImage3.duration = 1.5;
        
        [SpringImage3 animate];
        
        SpringImage4.hidden = YES;
        SpringLabel1.hidden = YES;
        
        [self performSelector:@selector(hideimage)
                   withObject:nil
                   afterDelay:4];
     
        AudioServicesPlayAlertSound (soundFileObject);
    }
}

- (void)hideimage
{

SpringImage3.hidden = YES;
AudioServicesDisposeSystemSoundID(soundFileObject);
    
}

- (void)toggleText
{
    //SpringLabel Animation.
    
    SpringLabel1.text = self.textValues[self.idx++];
    SpringLabel1.animation = @"fadeIn";
    SpringLabel1.curve = @"spring";
    SpringLabel1.force = 2.0;
    SpringLabel1.velocity = 0.7;
    SpringLabel1.damping = 0.7;
    SpringLabel1.delay = 3;
    SpringLabel1.duration = 2.0;
    SpringLabel1.autostart = true;
    
    [self performSelector:@selector(toggleText)
               withObject:nil
               afterDelay:3];
}


- (void)setIdx:(NSInteger)idx
{
    _idx = MAX(0, MIN(idx, idx % [self.textValues count]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
