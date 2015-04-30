//
//  WebViewController.m
//  AMAN JAIN
//
//  Created by Aman Jain on 02/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

{
    NSString *link;
}

@end

@implementation WebViewController
@synthesize WebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    link = @"http://digitalhole.co/OurApp.html"; //Website Url
    self.title = @"Loading...";
    NSURL *url = [NSURL URLWithString:link];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.WebView loadRequest:requestObj];
    
}

-(IBAction)back:(id)sender
{
     [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Hide Status Bar.
- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.title = link;
}

@end
