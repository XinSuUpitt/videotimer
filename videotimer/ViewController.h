//
//  ViewController.h
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
        blue:((float)((rgbValue & 0x0000FF) >> 0))/255.0 \
        alpha:1.0]

@class VideoController;
@class MusicViewController;

@protocol ViewControllerDelegate <NSObject>
- (void)enterToWebViewWithURLString:(NSString*) urlString;
- (void) showBackBtn;
@end

@interface ViewController : UITabBarController<UITabBarControllerDelegate, ViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *timerView;
    UIPickerView *pickerView;
    NSArray *pickerData;
    UIButton *cancelBtn;
    UIButton *confirmBtn;
    int seconds;
    int sec;
    int min;
    int hr;
    NSTimer *countDownTimer;
    
    UIImageView *setTimeView;
    
    UILabel *timerLabel;
    UIImageView *logoView;
    UILabel *logoLabel;
    UIImageView *backBtnView;
    UINavigationBar *newNavBar;
    BOOL inTimeView;
}
- (void) showBackBtn;
@property (nonatomic, strong) VideoController *videoCtrl;
@property (nonatomic, strong) MusicViewController *musicCtrl;

@end

