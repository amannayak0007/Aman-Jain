//
//  ViewController.m
//  Aman Jain
//
//  Created by Aman Jain on 16/04/15.
//  Copyright (c) 2014 aman. All rights reserved.
//

#import "AJViewFirst.h"
#import "AMAN_JAIN-Swift.h"

@interface AJViewFirst ()

@property (weak, nonatomic) IBOutlet SpringLabel *SpringLabel1;
@property (weak, nonatomic) IBOutlet SpringImageView *Springimage1;
@property (weak, nonatomic) IBOutlet SpringButton *SpringButton1;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) NSArray *textValues;

@end

@implementation AJViewFirst

@synthesize SpringLabel1;
@synthesize Springimage1;
@synthesize SpringButton1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _idx = 0;
    _textValues = @[
                    @"Hii 👋 ",
                    @"This Parcel📦 Is From India🇮🇳",
                    @"Tap 👇 Parcel📦 To Open It"
                    ];

    
 //SpringButton Animation.
    
    SpringButton1.animation = @"zoomIn";
    SpringButton1.curve = @"easeIn";
    SpringButton1.force = 2.0;
    SpringButton1.velocity = 0.7;
    SpringButton1.damping = 0.7;
    SpringButton1.delay = 0.2;
    SpringButton1.duration = 2.0;
    SpringButton1.autostart = true;
    
//SpringImage Animation.
    
   Springimage1.animation = @"slideUp";
   Springimage1.curve = @"spring";
   Springimage1.force = 2.0;
   Springimage1.velocity = 0.7;
   Springimage1.damping = 0.7;
   Springimage1.delay = 0;
   Springimage1.duration = 2.0;
   Springimage1.autostart = true;
    
    [self toggleText];

    
}

- (void)toggleText
{
    //SpringLabel Animation.
    
    SpringLabel1.text = self.textValues[self.idx++];
    SpringLabel1.animation = @"slideLeft";
    SpringLabel1.curve = @"spring";
    SpringLabel1.force = 2.0;
    SpringLabel1.velocity = 0.7;
    SpringLabel1.damping = 0.7;
    SpringLabel1.delay = 0.6;
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
