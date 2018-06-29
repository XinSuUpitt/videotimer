//
//  WebViewController.m
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewController.h"

@implementation WebViewController

- (void)loadViewWithUrlString:(NSString*) urlString
{
    webUrlString = [[NSString alloc] initWithString:urlString];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initUI];
}

- (void) initUI
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:@"http://www.youtube.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
}

@end
