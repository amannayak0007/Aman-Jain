//
//  ViewController.m
//  EBCardCollectionViewLayout
//
//  Created by Aman Jain on 14/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "AJAppViewController.h"
#import "AJCardCollectionView.h"
#import "DemoCollectionViewCell.h"
#import "URBMediaFocusViewController.h"
#import "WebViewController.h"
#import "AMAN_JAIN-Swift.h"

@interface AJAppViewController ()
{
    NSArray *peopleData;
}
@property (nonatomic, weak) UIImageView *tappedImageView;

@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusViewController;
@property (nonatomic, strong) WebViewController *webController;
@property (weak, nonatomic) IBOutlet SpringButton *SpringBackButton1;

@end

@implementation AJAppViewController

@synthesize webController;
@synthesize SpringBackButton1;

#pragma mark - Public

- (void)viewDidLoad {
    [super viewDidLoad];
    
    peopleData = @[@{@"name" : @"📒Solitary Guide", @"subtitle" : @"Solitary Guide iOS App", @"avatarFilename" : @"SolitaryGuide.jpg", @"detail":@"Solitary guide is a convenient app that helps children when there parents/guardians are out for some purpose. Solitary guide facilitate the children in there household purpose when they are alone at home. \n\nIt was my first app which got published on App Store.", @"link": @"https://itunes.apple.com/us/app/solitary-guide/id917701061?mt=8"},
                            
    @{@"name" : @"📰iDevices News", @"subtitle" : @"iDevices News iOS App", @"avatarFilename" : @"iDevicesNews.jpg",@"detail":@"iDevicesNews | all you need to know about iDevices. The official iDevices News app is the best source for the latest news about iOS devices.\n\nIt is a News Reader App which provides news related to iDevices with simple and elegant UI.", @"link": @"https://itunes.apple.com/us/app/idevices-news/id944192633?mt=8"},
                            
    @{@"name" : @"📰SMBC Insight", @"subtitle" : @"SMBC Insight", @"avatarFilename" : @"smbc insight.png",@"detail":@"I have created an National news channel app. It was my first app I've created for client. It's a news reader app with advance features like push notification, day and night mode and wonderfull UI design.", @"link": @"https://itunes.apple.com/us/app/smbc-insight/id889634216?mt=8"},];
    
    _people = [[NSMutableArray alloc] init];
    
    for (NSDictionary *personDict in peopleData) {
        Person *aPerson = [[Person alloc] initWithDictionary:personDict];
        [_people addObject:aPerson];
    }
    
    // The bigger the offset, the more you see on previous / next cards.
    UIOffset anOffset = UIOffsetMake(40, 10);
    [(AJCardCollectionView *)_collectionView.collectionViewLayout setOffset:anOffset];
    
    //SpringButton Animation
    SpringBackButton1.animation = @"pop";
    SpringBackButton1.curve = @"spring";
    SpringBackButton1.force = 1.0;
    SpringBackButton1.velocity = 0.7;
    SpringBackButton1.damping = 0.7;
    SpringBackButton1.delay = 0.2;
    SpringBackButton1.duration = 3.0;
    SpringBackButton1.autostart = true;
    
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
