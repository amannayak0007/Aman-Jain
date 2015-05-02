//
//  AboutMeViewController.m
//  Created by Aman Jain on 14/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AJCardCollectionView.h"
#import "DemoCollectionViewCell.h"
#import "URBMediaFocusViewController.h"
#import "AMAN_JAIN-Swift.h"

@interface AboutMeViewController ()
@property (nonatomic, weak) UIImageView *tappedImageView;

@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusViewController;
@property (weak, nonatomic) IBOutlet SpringButton *SpringBackButton;
@end

@implementation AboutMeViewController
@synthesize SpringBackButton;

#pragma mark - Public

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *peopleData = @[@{@"name" : @"🙇Aman Jain", @"subtitle" : @"🐦@amanj203", @"avatarFilename" : @"profile.png", @"detail":@"Hey there! My name is AMAN JAIN. I'm a 19 year old developer, designer and university student from M.P., INDIA🇮🇳. \n\nI'm a self thought iOS and web developer. I've been programming for five year and playing with iOS for the past three. In my spare time I write blogs. Currently I'm a editor of National news channel 'SMBC Insight'. \n\nI continue to expand my knowledge everyday. Not a day goes by where I don't open Xcode. I love to make amazing Apps and am very passionate about it."},
                            
    @{@"name" : @"🏢Digital Hole", @"subtitle" : @"🐦@DigitalholeCorp", @"avatarFilename" : @"Digitalhole.jpg",@"detail":@"I created my own company, DigitalHole co., in 2014. It is a small passionate, and powerful team that value people over profits, quality over quantity, and keeping it real. As such, we deliver an unmatched working relationship with our client. Our team is intentionally small, eclectic, and skilled, we provide adorable products on both the design and development side. \n\nI always wanted to become a successful Entrepreneur and it was my first step."},
                            
    @{@"name" : @"✏️Education", @"subtitle" : @"St.Aloysius College", @"avatarFilename" : @"Education.jpg",@"detail":@" I'm pursuing BCA (Bachelor of Computer Application) from St.Aloysius College. Here I learned how to code and design adorable things. \n\nRecently I've finished my internship in a tech company called 'KreyonSystems Pvt Ltd.' Here I've workd on some of the iOS project."},
                            
    @{@"name" : @"💭Future Plan", @"subtitle" : @"FuturePlan", @"avatarFilename" : @"FuturePlan.jpg",@"detail":@"Next year I plan on graduating university & possibly pursuing postgradute studies, I'd love to learn as much as I can. \n\nAfterwards, I want to live overseas and do meaningful work, ideally in San Francisco by really, anywhere would be an adventure. \n\nUltimately , my dream is to take my company to the next level that makes a real diffrence & changes the world for the better."},
                            
    @{@"name" : @"🎵Interest", @"subtitle" : @"Interest", @"avatarFilename" : @"interest.jpg", @"detail":@"My interest is to design and develop iOS & Web application. In my spare time I like to play video game, listen to music and read book & work on my own projects. I love to travel overseas. I am also interested in writing blogs.\n\nLove to be updated with latest happening from all around the world of Tech."},
                            
    @{@"name" : @"Inspiration", @"subtitle" : @"Inspiration", @"avatarFilename" : @"inspiration.jpg",@"detail":@"Steve Jobs is my idol, my inspiration, and I hope he still has a few more bullet points left. Even though Steve Jobs has passed he's left us with a foundation for great technology and a story that make him the perfect leader for people like me. My favorite quote which inspired me is -\n\n“Design is not just what it looks like and feels like. Design is how it works.” \n\nThank you for everything, Steve Jobs. I love you ❤️."},
                            
    @{@"name" : @"🏆Achievements", @"subtitle" : @"Achievements", @"avatarFilename" : @"Achievement.jpg",@"detail" : @"My iOS App got First prize in Software Model on TechFest Talent Explorer 2015. I've organized many workshop on iOS Development at colleges, which got massive response. Got praised by many tech giants. I have got many prices for developing mobile and web application at school. \n\nAttending WWDC15 will be my biggest Achievement."} ];
    
    _people = [[NSMutableArray alloc] init];
    
    for (NSDictionary *personDict in peopleData) {
        Person *aPerson = [[Person alloc] initWithDictionary:personDict];
        [_people addObject:aPerson];
    }
    
    //  The bigger the offset, the more you see on previous / next cards.
    UIOffset anOffset = UIOffsetMake(40, 10);
    [(AJCardCollectionView *)_collectionView.collectionViewLayout setOffset:anOffset];
    
    //SpringButton Animation
    SpringBackButton.animation = @"pop";
    SpringBackButton.curve = @"spring";
    SpringBackButton.force = 1.0;
    SpringBackButton.velocity = 0.7;
    SpringBackButton.damping = 0.7;
    SpringBackButton.delay = 0.2;
    SpringBackButton.duration = 3.0;
    SpringBackButton.autostart = true;
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_people count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoCollectionViewCell *retVal = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell"
                                                                              forIndexPath:indexPath];
    retVal.person = _people[indexPath.row];
    return retVal;
}

- (BOOL)shouldAutorotate {
    [_collectionView.collectionViewLayout invalidateLayout];
    
    BOOL retVal = YES;
    return retVal;
}

-(IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)handleTapGestureRecognizer:(UITapGestureRecognizer *)recognizer {
    URBMediaFocusViewController *controller = [[URBMediaFocusViewController alloc] init];
    [controller showImage:self.tappedImageView.image fromView:self.view inViewController:self];
    controller.delegate = self;
    self.mediaFocusViewController = controller;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIImageView class]]) {
        self.tappedImageView = (UIImageView *)touch.view;
        return YES;
    }
    return NO;
}

//UIViewControllerBasedStatusBarAppearance

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
