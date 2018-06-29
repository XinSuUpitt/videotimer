//
//  ViewController.m
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import "ViewController.h"
#import "MusicViewController.h"
#import "VideoController.h"
#import "VTManager.h"
#import "UIView+VTimer.h"
#import "WebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view has been loaded");
    [self initChildControllers];
    [self initTabs];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initNavigationBar];
}

- (void)initChildControllers
{
    self.view.backgroundColor = [UIColor clearColor];
    
    self.videoCtrl = [[VideoController alloc] initWithNibName:@"VideoController" bundle:nil];
    self.videoCtrl.delegate = self;
    self.musicCtrl = [[MusicViewController alloc] initWithNibName:@"MusicViewController" bundle:nil];
    self.musicCtrl.delegate = self;
}

- (void)initTabs
{
    
    self.viewControllers = @[self.videoCtrl, self.musicCtrl];
    [self.tabBar setTintColor:UIColorFromRGB(0xDB434F)];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    [self.tabBar.layer setBorderWidth:0.1f];
    [self.tabBar.layer setBorderColor:[UIColor grayColor].CGColor];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    self.videoCtrl.title = @"video";
    self.musicCtrl.title = @"music";
    self.videoCtrl.tabBarItem.image = [UIImage imageNamed:@"Movie"];
    self.musicCtrl.tabBarItem.image = [UIImage imageNamed:@"musical_notes"];
    
    
    self.selectedIndex = 0;
}

- (void)initNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UINavigationBar *topBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), [VTManager isPhoneX]?44:20)];
    [topBar setTintColor:[UIColor whiteColor]];
    [self.view addSubview:topBar];
    
    newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, [VTManager isPhoneX]?44:20, CGRectGetWidth(self.view.bounds), 64.0)];
    [newNavBar setTintColor:[UIColor whiteColor]];
    
    
    logoView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 20, 20)];
    [logoView setImage:[UIImage imageNamed:@"logo_videoTimer"]];
    //[newNavBar addSubview:logoView];
    
    logoLabel = [[UILabel alloc] init];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [logoLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0]];
    [logoLabel setText:@"VTimer"];
    [logoLabel setTextColor:[UIColor blackColor]];
    [logoLabel sizeToFit];
    [newNavBar addSubview:logoLabel];
    [[logoLabel marginLeft:10] marginTop:10];
    
    setTimeView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40, 8, 28, 28)];
    [setTimeView setImage:[UIImage imageNamed:@"clock"]];
    [newNavBar addSubview:setTimeView];
    [setTimeView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setTimeTapped)];
    [setTimeView addGestureRecognizer:tapGesture];

    [self.view addSubview:newNavBar];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)enterToWebViewWithURLString:(NSString*) urlString
{
    WebViewController *webViewCtrl = [[WebViewController alloc] initWithNibName:@"WebView" bundle:nil];
    [self.navigationController pushViewController:webViewCtrl animated:YES];
    [webViewCtrl loadViewWithUrlString:urlString];
}

- (void)setTimeTapped
{
    [countDownTimer invalidate];
    seconds = 0;
    inTimeView = YES;
    [self setUpTimerView];
}

- (void)setUpTimerView
{
    timerView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:timerView];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = timerView.frame;
    [timerView addSubview:blurEffectView];
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [blurEffectView.contentView addSubview:vibrancyView];
    
    UIImageView *setTimeView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 40, ([VTManager isPhoneX]?44:20)+8, 28, 28)];
    [setTimeView setImage:[UIImage imageNamed:@"clock"]];
    [timerView addSubview:setTimeView];
    [setTimeView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBackFromTimer)];
    [setTimeView addGestureRecognizer:tapGesture];
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width-50, 150)];
    [pickerView setBackgroundColor:[UIColor clearColor]];
    [pickerView setTintColor:[UIColor whiteColor]];
    [timerView addSubview:pickerView];
    pickerData = @[@[@"0", @"1", @"2", @"3", @"4", @"5", @"6"],
                   @[@"0", @"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26",@"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36",@"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56",@"57", @"58", @"59"],
                   @[@"0", @"1", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26",@"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36",@"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56",@"57", @"58", @"59"] ];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    UILabel *hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 80, 20)];
    [hourLabel setText:@"hours"];
    [hourLabel setTextColor:[UIColor blackColor]];
    [hourLabel setTextAlignment:NSTextAlignmentCenter];
    [hourLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
    [hourLabel setCenter:CGPointMake(pickerView.frame.size.width/3-10, pickerView.center.y)];
    [timerView addSubview:hourLabel];
    UILabel *minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 80, 20)];
    [minuteLabel setText:@"minutes"];
    [minuteLabel setTextColor:[UIColor blackColor]];
    [minuteLabel setTextAlignment:NSTextAlignmentCenter];
    [minuteLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
    [minuteLabel setCenter:CGPointMake(pickerView.frame.size.width*2/3, pickerView.center.y)];
    [timerView addSubview:minuteLabel];
    UILabel *secondeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 80, 20)];
    [secondeLabel setText:@"seconds"];
    [secondeLabel setTextColor:[UIColor blackColor]];
    [secondeLabel setTextAlignment:NSTextAlignmentCenter];
    [secondeLabel setFont:[UIFont fontWithName:@"Arial" size:18]];
    [secondeLabel setCenter:CGPointMake(self.view.frame.size.width-50, pickerView.center.y)];
    [timerView addSubview:secondeLabel];
    
    cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4-35, self.view.frame.size.height/2-35, 70, 70)];
    UIImageView *circleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,70, 70)];
    circleview.layer.cornerRadius = 35;
    circleview.layer.borderWidth = 35;
    circleview.layer.borderColor = UIColorFromRGB(0xFFFAF0).CGColor;
    [cancelBtn addSubview:circleview];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchDown];
    [timerView addSubview:cancelBtn];
    
    confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*3/4-35, self.view.frame.size.height/2-35, 70, 70)];
    UIImageView *circleview2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,70, 70)];
    circleview2.layer.cornerRadius = 35;
    circleview2.layer.borderWidth = 35;
    circleview2.layer.borderColor = UIColorFromRGB(0x000000).CGColor;
    [confirmBtn addSubview:circleview2];
    [confirmBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:UIColorFromRGB(0xFFFAF0) forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(submitBtnClicked) forControlEvents:UIControlEventTouchDown];
    [timerView addSubview:confirmBtn];
}

- (void)showTimer
{
    timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 150, ([VTManager isPhoneX]?44:20)+15, 100, 15)];
    [timerLabel setTextAlignment:NSTextAlignmentCenter];
    //[timerLabel setCenter:CGPointMake(self.view.frame.size.width*2/3, setTimeView.center.y)];
    [self.view addSubview:timerLabel];
    [timerLabel setHidden:NO];
}

#pragma mark - pickerView delegate methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [pickerData[component] count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        hr = (int)row;
    } else if (component == 1) {
        min = (int)row;
    } else if (component == 2) {
        sec = (int)row;
    }
}

#pragma mark - button click method
- (void)goBackFromTimer
{
    [timerView removeFromSuperview];
}

- (void) cancelBtnClicked
{
    NSLog(@"cancel tapped, %d", seconds);
    seconds = 0;
    [self goBackFromTimer];
    [timerLabel setHidden:YES];
}

- (void) submitBtnClicked
{
    NSLog(@"submit tapped, %d", seconds);
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerCountDownFire) userInfo:nil repeats:YES];
    seconds = 3600*hr+60*min+sec;
    [self showTimer];
    [self goBackFromTimer];
}

#pragma mark - count down method
- (void) timerCountDownFire
{
    seconds--;
    [self updateTimer];
    if (seconds <= 0) {
        [countDownTimer invalidate];
        [self.videoCtrl invalidateWebView];
        [self.musicCtrl invalidateWebView];
        [timerLabel setHidden:YES];
    }
}

- (void)updateTimer
{
    int hour = seconds/3600;
    int min = (seconds - hour*3600)/60;
    int second = (seconds - hour*3600-min*60);
    timerLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min, second];
}

#pragma mark - show back btn
- (void) showBackBtn
{
    NSLog(@"show back button");
    [logoView setHidden:YES];
    [logoLabel setHidden:YES];
    backBtnView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 10, 24, 24)];
    [backBtnView setImage:[UIImage imageNamed:@"icons8-left-50"]];
    [backBtnView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backBtnClicked)];
    [backBtnView addGestureRecognizer:tapGesture];
    [newNavBar addSubview:backBtnView];
}

- (void)backBtnClicked
{
    [backBtnView setHidden:YES];
    [logoLabel setHidden:NO];
    [logoView setHidden:NO];
    [self.videoCtrl invalidateWebView];
    [self.musicCtrl invalidateWebView];
}

@end
