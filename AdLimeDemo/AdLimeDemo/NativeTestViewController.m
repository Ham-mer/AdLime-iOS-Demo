//
//  NativeTestViewController.m
//  iOS_AutoTest
//
//  Created by Hammer on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "NativeTestViewController.h"
@import AdLimeSdk;
#import "Masonry.h"
#import "util/macro.h"
#import "util/UIView+Toast.h"
//#import <AdLimeMediation_Vungle/AdLimeMediation_Vungle.h>

@interface NativeTestViewController () <AdLimeNativeAdDelegate>

@property (nonatomic, strong) AdLimeNativeAd *nativeAd;
@property (nonatomic, strong) UIView *nativeAdView;

@property (nonatomic, strong) UIButton *showNativeBtn;
@property (nonatomic, strong) AdLimeNativeAdLayout *nativeLayout;

@end

@implementation NativeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UILabel *titleLab =  [[UILabel alloc]init];
    titleLab.text = self.titleStr;
    [titleLab setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(header);
        make.width.equalTo(@(250));
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [header addSubview:backBtn];
    
    [backBtn addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
    }];
    
    UIButton *loadNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loadNativeBtn];
    [loadNativeBtn setTitle:@"load Native" forState:UIControlStateNormal];
    //[loadNativeBtn setBackgroundColor:[UIColor blueColor]];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadNativeBtn addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    
    [loadNativeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(10);
        make.width.equalTo(@(200));
        make.height.equalTo(@(20));
    }];
    
    self.showNativeBtn = loadNativeBtn;
    
     //[self createNativeAd];    // nativeLayout
    [self createDefaultNativeAd]; //get default NativeLayout
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createNativeAd {
    UIView *adView = [[UIView alloc] init];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showNativeBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    adView.hidden = YES;
    
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 250)];
    
    UIView *mediaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 150)];
    [rootView addSubview:mediaView];
    
    UIView *icon = [[UIView alloc] initWithFrame:CGRectMake(5, 160, 60, 60)];
    [rootView addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(80, 160, ScreenWidth-20-80, 20)];
    title.numberOfLines = 1;
    [title setTextColor:[UIColor greenColor]];
    [rootView addSubview:title];
    
    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, ScreenWidth-20-80, 40)];
    [desc setTextColor:[UIColor grayColor]];
    desc.numberOfLines = 2;
    [rootView addSubview:desc];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.frame = CGRectMake(200, desc.frame.origin.y + 40, 100, 20);
    [rootView addSubview:btn];
    
    AdLimeNativeAdLayout *layout = [[AdLimeNativeAdLayout alloc] init];
    layout.rootView = rootView;
    layout.titleLabel = title;
    layout.bodyLabel = desc;
    layout.mediaView = mediaView;
    layout.callToActionView = btn;
    layout.iconView = icon;
    
    self.nativeLayout = layout;
}

- (void)createDefaultNativeAd {
    UIView *adView = [[UIView alloc] init];

    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showNativeBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-20);
    }];

    adView.hidden = YES;
    
    self.nativeLayout = [AdLimeNativeAdLayout getLargeLayout2WithWidth:ScreenWidth-20];
}

- (void) loadNative {
    if (!useAdLoader) {
        if (self.nativeAd == nil) {
            AdLimeNetworkConfigs *configs = [[AdLimeNetworkConfigs alloc] init];
            
//            AdLimeVungleInFeedConfig *config = [[AdLimeVungleInFeedConfig alloc] init];
//            [config setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 500)];
//            [configs addConfig:config];
            
            self.nativeAd = [[AdLimeNativeAd alloc] initWithAdUnitId:self.adUnitID];
            self.nativeAd.delegate = self;
            [self.nativeAd setNativeAdLayout:self.nativeLayout];
            [self.nativeAd setNetworkConfigs:configs];
        }
        [self.nativeAd loadAd];
    } else {
        [AdLimeAdLoader getNativeAd:self.adUnitID].delegate = self;
        [AdLimeAdLoader loadNativeAd:self.adUnitID nativeAdLayout:self.nativeLayout];
    }
    
}

- (void)showNative {
    if (!useAdLoader) {
        if (self.nativeAd.isReady) {
            UIView *adView = [self.nativeAd getAdView];
            [self.nativeAdView addSubview:adView];
            
            //adView.center = CGPointMake(self.nativeAdView.bounds.size.width/2, self.nativeAdView.bounds.size.height/2);
            [adView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.nativeAdView);
                make.centerY.equalTo(self.nativeAdView);
            }];
            
            self.nativeAdView.hidden = NO;
        }
    } else {
        if ([AdLimeAdLoader isNativeAdReady:self.adUnitID] ) {
            [AdLimeAdLoader showNativeAd:self.adUnitID container:self.nativeAdView];
            self.nativeAdView.hidden = NO;
        }
    }
}

#pragma mark <AdLimeInnerNativeAdDelegate>
- (void)adLimeNativeAdDidReceiveAd:(AdLimeNativeAd *)nativeAd {
    NSLog(@"AdLimeNativeAd adLimeNativeAdDidReceiveAd, nativeAd.adUnitId is %@", nativeAd.adUnitId);
    [self showNative];
    self.showNativeBtn.enabled = YES;
}


- (void)adLimeNativeAd:(AdLimeNativeAd *)nativeAd didFailToReceiveAdWithError:(AdLimeAdError *)adError{
    NSLog(@"AdLimeNativeAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
     [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}


- (void)adLimeNativeAdWillPresentScreen:(AdLimeNativeAd *)nativeAd{
    NSLog(@"AdLimeNativeAd adLimeNativeAdWillPresentScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


- (void)adLimeNativeAdDidDismissScreen:(AdLimeNativeAd *)nativeAd{
    NSLog(@"AdLimeNativeAd adLimeNativeAdDidDismissScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


- (void)adLimeNativeAdWillLeaveApplication:(AdLimeNativeAd *)nativeAd {
    NSLog(@"AdLimeNativeAd adLimeNativeAdWillLeaveApplication, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
