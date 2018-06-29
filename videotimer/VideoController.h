//
//  VideoController.h
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface VideoController: UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat width;
    CGFloat height;
    
    CGFloat cellHeight;
    UITableView *table;
    UIImageView *imgView;
    UIWebView *webView;
    UIImageView *backBtnView;
    NSURLRequest *urlRequest;
}

- (void)invalidateWebView;

@property (nonatomic, assign) id<ViewControllerDelegate> delegate;
@end
