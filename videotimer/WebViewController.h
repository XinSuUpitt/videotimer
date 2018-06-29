//
//  WebViewController.h
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController: UIViewController {
    NSString *webUrlString;
}

- (void)loadViewWithUrlString:(NSString*) urlString;

@end
