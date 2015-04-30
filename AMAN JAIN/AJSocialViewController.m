//
//  AJSocialViewController.m
//  AMAN JAIN
//
//  Created by Amrun on 18/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "AJSocialViewController.h"
#import "AMAN_JAIN-Swift.h"

@interface AJSocialViewController ()
@property (weak, nonatomic) IBOutlet SpringImageView *SpringViewProfile;
@property (weak, nonatomic) IBOutlet SpringImageView *SpringViewhide;
@property (weak, nonatomic) IBOutlet SpringButton *SpringBackButton2;
@end

@implementation AJSocialViewController
@synthesize SpringViewProfile;
@synthesize SpringViewhide;
@synthesize SpringBackButton2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width /2;
    self.profileImageView.layer.borderWidth = 2.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImageView.clipsToBounds = YES;
    
    //Spring View Animation
    
    SpringViewProfile.animation = @"zoomIn";
    SpringViewProfile.force = 1.0;
    SpringViewProfile.velocity = 0.7;
    SpringViewProfile.damping = 0.7;
    SpringViewProfile.delay = 0.2;
    SpringViewProfile.duration = 3.0;
    SpringViewProfile.autostart = true;
    
    //SpringButton Animation
    SpringBackButton2.animation = @"pop";
    SpringBackButton2.curve = @"spring";
    SpringBackButton2.force = 1.0;
    SpringBackButton2.velocity = 0.7;
    SpringBackButton2.damping = 0.7;
    SpringBackButton2.delay = 0.2;
    SpringBackButton2.duration = 3.0;
    SpringBackButton2.autostart = true;

   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//UIViewControllerBasedStatusBarAppearance

-(UIStatusBarStyle)preferredStatusBarStyle

{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Portfolio:(id)sender {
    
   // opening the app in Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.devaman.com/"]]) {
            
        }
    
}


- (IBAction)twitterButton:(id)sender {
    
    // open the Twitter App
    if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=amanj203"]]) {
        
        // opening the app didn't work - let's open Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/amanj203"]]) {
            
        }
    }
}



- (IBAction)facebookButton:(id)sender {
        
        // open the Twitter App
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/100002216255456"]]) {
            
            // opening the app didn't work - let's open Safari
            if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/amannayak15"]]) {
                
            }
        }
    }



- (IBAction)EmailButton:(id)sender {
    
    // open the Twitter App
    if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:amanj3777@gmail.com"]]) {
        
        // opening the app didn't work - let's open Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:amannayak15@gmail.com"]]) {

        }
    }
}

- (IBAction)PinterestButton:(id)sender {
    
    // open the Twitter App
    if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"pinterest://user/amannayak15"]]) {
        
        // opening the app didn't work - let's open Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://in.pinterest.com/amannayak15/"]]) {

        }
    }
}


- (IBAction)DribbbleButton:(id)sender {
    
    // open the Twitter App
    if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@""]]) {
        
        // opening the app didn't work - let's open Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://dribbble.com/amanj203"]]) {

        }
    }
}

- (IBAction)LinkdinButton:(id)sender {
    
    // open the Twitter App
    if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"linkedin://#profile/318711293"]]) {
        
        // opening the app didn't work - let's open Safari
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://in.linkedin.com/pub/aman-jain/8a/89b/4a5"]]) {

        }
    }
}


@end
