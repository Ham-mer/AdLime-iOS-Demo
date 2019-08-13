//
//  ViewController.m
//  wesdk_ios_demo
//
//  Created by we on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import "ViewController.h"
@import AdLimeSdk;

#define testBannerId        @"57be18f5-7030-4a46-8fc9-49b4abbd2438"
#define testInterstialId    @"875f429e-19a3-49d3-ae90-79f55bf81ef8"
#define testNativeId        @"3f733527-5202-4869-b148-73962fadbb88"
#define testRewardId        @"f5f0cdb5-b18f-4e56-82f4-00d5238b31b0"


@interface ViewController ()<AdLimeBannerViewDelegate, AdLimeInterstitialAdDelegate, AdLimeNativeAdDelegate, AdLimeRewardedVideoAdDelegate>


@property (nonatomic, strong) AdLimeNativeAd *nativeAd;
@property (nonatomic, strong) UIView *nativeAdView;

@property (nonatomic, strong) AdLimeInterstitialAd *interstitalAd;
@property (nonatomic, strong) AdLimeRewardedVideoAd *rewardAd;

@property (nonatomic, strong) UIButton *showIntBtn;
@property (nonatomic, strong) UIButton *showNativeBtn;

@property (nonatomic, strong) UIButton *showRewardBtn;

@property (nonatomic, strong) UIView *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *testBannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBannerBtn.frame = CGRectMake((ScreenWidth-200)/2, kTopBarSafeHeight+20, 200, 30);
    [self.view addSubview:testBannerBtn];
    [testBannerBtn setTitle:@"load banner" forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBannerBtn addTarget:self action:@selector(testBanner) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testloadIntBtn.frame = CGRectMake(20, testBannerBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load Intersitial" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat left = ScreenWidth - 150 - 20;
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testshowIntBtn.frame = CGRectMake(left, testloadIntBtn.frame.origin.y, 150, 30);
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show Intersitial" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    UIButton *loadNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadNativeBtn.frame = CGRectMake(20, testshowIntBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:loadNativeBtn];
    [loadNativeBtn setTitle:@"load Native" forState:UIControlStateNormal];
    //[loadNativeBtn setBackgroundColor:[UIColor blueColor]];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadNativeBtn addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *showNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showNativeBtn.frame = CGRectMake(left, loadNativeBtn.frame.origin.y, 150, 30);
    [self.view addSubview:showNativeBtn];
    [showNativeBtn setTitle:@"show Native" forState:UIControlStateNormal];
    //[showNativeBtn setBackgroundColor:[UIColor blueColor]];
    [showNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [showNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [showNativeBtn addTarget:self action:@selector(showNative) forControlEvents:UIControlEventTouchUpInside];
    showNativeBtn.enabled = NO;
    self.showNativeBtn = showNativeBtn;
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadRewardBtn.frame = CGRectMake(20, loadNativeBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:loadRewardBtn];
    [loadRewardBtn setTitle:@"load Reward" forState:UIControlStateNormal];
    //[loadRewardBtn setBackgroundColor:[UIColor blueColor]];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rewardShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rewardShowBtn.frame = CGRectMake(left, loadRewardBtn.frame.origin.y, 150, 30);
    [self.view addSubview:rewardShowBtn];
    [rewardShowBtn setTitle:@"show Reward" forState:UIControlStateNormal];
    //[rewardShowBtn setBackgroundColor:[UIColor blueColor]];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [rewardShowBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [rewardShowBtn addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    
    rewardShowBtn.enabled = NO;
    self.showRewardBtn = rewardShowBtn;
}



- (void)testBanner {
    UIView *banner = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-kBottomSafeHeight-70, ScreenWidth, 70)];
    [banner setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:banner];
    self.banner = banner;
    banner.hidden = YES;
    
    AdLimeBannerView *bannerView = [[AdLimeBannerView alloc] initWithAdUnitId:testBannerId rootViewController:self];
    bannerView.delegate = self;
    
    bannerView.center = banner.center;
    
    [self.banner addSubview:bannerView];
    [bannerView loadAd];
}

#pragma mark AdLimeBannerViewDelegate
- (void)adLimeBannerDidReceiveAd:(AdLimeBannerView *)bannerView{
    self.banner.hidden = NO;
    CGFloat x = (ScreenWidth-320)/2;
    bannerView.frame = CGRectMake(x, 10, 320, 50);
}

- (void)adLimeBanner:(AdLimeBannerView *)bannerView didFailToReceiveAdWithError:(AdLimeAdError *)adError {
    NSLog(@"AdLimeBannerView didFailToReceiveAdWithError %d", (int)[adError getCode]);
}



#pragma  mark intersitial
- (void) loadInteristial {
    self.interstitalAd = [[AdLimeInterstitialAd alloc] initWithAdUnitId:testInterstialId];
    self.interstitalAd.delegate = self;
    [self.interstitalAd loadAd];
}

- (void)showInterstitial {
    if (self.interstitalAd.isReady)
    {
        [self.interstitalAd showFromViewController:self];
    }
}

#pragma mark <WECreativeInterstitialDelegate>
- (void)adLimeInterstitialDidReceiveAd:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialDidReceiveAd");
    self.showIntBtn.enabled = YES;
}

- (void)adLimeInterstitial:(AdLimeInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(AdLimeAdError *)adError{
    NSLog(@"AdLimeInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
}

- (void)adLimeInterstitialWillPresentScreen:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialWillPresentScreen");
}

- (void)adLimeInterstitialDidDismissScreen:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialDidDismissScreen");
}

- (void)adLimeInterstitialWillLeaveApplication:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialWillLeaveApplication");
}

- (void) loadNative {
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(10, ScreenHeight-kBottomSafeHeight-70-270, ScreenWidth-20, 250)];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
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
    
    self.nativeAd = [[AdLimeNativeAd alloc] initWithAdUnitId:testNativeId];
    self.nativeAd.delegate = self;
    
    AdLimeNativeAdLayout *layout = [[AdLimeNativeAdLayout alloc] init];
    layout.rootView = rootView;
    layout.titleLabel = title;
    layout.bodyLabel = desc;
    layout.mediaView = mediaView;
    layout.callToActionView = btn;
    layout.iconView = icon;
    [self.nativeAd setNativeAdLayout:layout];
    
    [self.nativeAd loadAd];
    self.nativeAdView = adView;
}

- (void)showNative {
    if (self.nativeAd.isReady) {
        UIView *adView = [self.nativeAd getAdView];
        [self.nativeAdView addSubview:adView];
        self.nativeAdView.hidden = NO;
    }
}

#pragma mark <AdLimeInnerNativeAdDelegate>
- (void)adLimeNativeAdDidReceiveAd:(AdLimeNativeAd *)nativeAd {
    NSLog(@"AdLimeNativeAd adLimeNativeAdDidReceiveAd");
    self.showNativeBtn.enabled = YES;
}


- (void)adLimeNativeAd:(AdLimeNativeAd *)nativeAd didFailToReceiveAdWithError:(AdLimeAdError *)adError{
    NSLog(@"AdLimeNativeAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
}


- (void)adLimeNativeAdWillPresentScreen:(AdLimeNativeAd *)nativeAd{
    NSLog(@"AdLimeNativeAd adLimeNativeAdWillPresentScreen");
}


- (void)adLimeNativeAdDidDismissScreen:(AdLimeNativeAd *)nativeAd{
    NSLog(@"AdLimeNativeAd adLimeNativeAdDidDismissScreen");
}


- (void)adLimeNativeAdWillLeaveApplication:(AdLimeNativeAd *)nativeAd {
    NSLog(@"AdLimeNativeAd adLimeNativeAdWillLeaveApplication");
}

- (void)loadReward {
    self.rewardAd = [[AdLimeRewardedVideoAd alloc] initWithAdUnitId:testRewardId];
    self.rewardAd.delegate = self;
    [self.rewardAd loadAd];
}

- (void)showReward {
    if (self.rewardAd.isReady)
    {
        [self.rewardAd showFromViewController:self];
    }
}

- (void)adLimeRewardedVideoDidReceiveAd:(AdLimeRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidReceiveAd");
    self.showRewardBtn.enabled = YES;
}


- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(AdLimeAdError *)adError {
    NSLog(@"adLimeRewardedVideo didFailToReceiveAdWithError %d",(int)[adError getCode]);
}

- (void)adLimeRewardedVideoDidStart:(AdLimeRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidStart");
}

- (void)adLimeRewardedVideoDidComplete:(AdLimeRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidComplete");
}

- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didReward:(AdLimeRewardItem *)item {
    NSLog(@"adLimeRewardedVideo did reward");
}

@end
