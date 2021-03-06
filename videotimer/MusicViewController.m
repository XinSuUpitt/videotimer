//
//  MusicViewController.m
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicViewController.h"
#import "UIView+VTimer.h"
#import "ViewController.h"
#import "VTManager.h"
#import "WebViewController.h"
#import "ViewController.h"

@implementation MusicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    width = UIScreen.mainScreen.bounds.size.width;
    height = UIScreen.mainScreen.bounds.size.height;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initTable];
}

- (void) initTable
{
    cellHeight = height/4;
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, [VTManager isPhoneX]?88:64, width, height-([VTManager isPhoneX]?88:64))];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    table.separatorColor = [UIColor clearColor];
    table.backgroundView = nil;
    table.showsVerticalScrollIndicator = NO;
    [self.view addSubview:table];
}

#pragma mark - table delegate method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"videoTableCell"];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        UIView *cardView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, width-20, cellHeight-10)];
        [cell addSubview:cardView];
        [cardView setBackgroundColor:UIColorFromRGB(0xFFFAF0)];
        if ([indexPath row] == 0) {
            imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, width-60, cellHeight-80)];
        } else {
            imgView = [[UIImageView alloc] initWithFrame:CGRectMake(width/2-60, cellHeight/2-60, 120, 120)];
        }
        
        [cardView addSubview:imgView];
    }
    
    switch ([indexPath row]) {
        case 0:
            [imgView setImage:[UIImage imageNamed:@"spotify"]];
            break;
        case 1:
            [imgView setImage:[UIImage imageNamed:@"netEase_music"]];
            break;
        default:
            break;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *urlString;
    switch ([indexPath row]) {
        case 0:
            urlString = @"https://www.spotify.com/us/";
            break;
        case 1:
            urlString = @"https://music.163.com/";
            break;
        default:
            urlString = @"https://www.spotify.com/us/";
            break;
    }
    NSLog(@"Clicked and url is %@", urlString);
    webView = [[UIWebView alloc] initWithFrame:table.frame];
    [webView setAllowsInlineMediaPlayback:YES];
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:urlString];
    urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
    //[self.delegate enterToWebViewWithURLString:urlString];
    [self.delegate showBackBtn];
}



- (void)invalidateWebView
{
    [webView loadRequest:urlRequest];
    [webView removeFromSuperview];
}

- (void) showBackBtn
{
    NSLog(@"show back button");
    backBtnView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 8, 36, 36)];
    [backBtnView setImage:[UIImage imageNamed:@"icons8-left-50"]];
    [self.view addSubview:backBtnView];
    
}
@end
