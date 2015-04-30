//
//  AJSkillViewViewController.m
//  AMAN JAIN
//
//  Created by Aman Jain on 16/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "AJSkillViewViewController.h"
#import "SkillTableViewCell.h"
#import "AMAN_JAIN-Swift.h"

static CGFloat kImageOriginHight = 240.f;

@interface AJSkillViewViewController ()

{
    
    NSMutableArray *Skills;
    
}

@property (strong, nonatomic) IBOutlet UIImageView *expandZoomImageView;
@property (weak, nonatomic) SpringButton *but;
@end

@implementation AJSkillViewViewController
@synthesize but;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Skills = [[NSMutableArray alloc] init];
    
    [Skills addObject:@{@"title": @"Language",@"detail": @"HTML, CSS, Objective-C, Swift, Java Script, PHP", @"thumb": @"effect1.png"}];
    [Skills addObject:@{@"title": @"Graphic Design",@"detail": @"Sketch, Adobe InDesign, Adobe Photoshop, Adobe Flash, Illustrator, After Effect, Omnigraffle", @"thumb": @"effect2.png"}];
    [Skills addObject:@{@"title": @"Video Editing",@"detail": @"Adobe Premiere, Final Cut Pro, After Effects, iMovie", @"thumb": @"effect3.png"}];
    [Skills addObject:@{@"title": @"Development",@"detail": @"Xcode, Atom, Xcope", @"thumb": @"effect4.png"}];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
    [self.tableView addSubview:self.expandZoomImageView];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
     but= [SpringButton buttonWithType:UIButtonTypeRoundedRect];
    
    [but addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [but setFrame:CGRectMake(16, 22, 30, 30)];
    [but setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [but setExclusiveTouch:YES];
    [self.expandZoomImageView addSubview:but];
    
    //SpringButton Animation
    but.animation = @"pop";
    but.curve = @"spring";
    but.force = 1.0;
    but.velocity = 0.7;
    but.damping = 0.7;
    but.delay = 0.2;
    but.duration = 3.0;
    but.autostart = true;
    
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]] ];
}

-(void) buttonClicked:(UIButton*)sender
{
      [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.expandZoomImageView.frame = CGRectMake(0, -kImageOriginHight, self.tableView.frame.size.width, kImageOriginHight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -kImageOriginHight) {
        CGRect f = self.expandZoomImageView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        self.expandZoomImageView.frame = f;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [Skills count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    SkillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.titleLabel.text = [Skills valueForKey:@"title"][indexPath.row];
    cell.DetailLabel.text = [Skills valueForKey:@"detail"][indexPath.row];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[Skills valueForKey:@"thumb"][indexPath.row]]];
    
    return cell;
    
}

//UIViewControllerBasedStatusBarAppearance
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
