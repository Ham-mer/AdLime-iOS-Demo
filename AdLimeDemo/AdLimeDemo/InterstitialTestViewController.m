//
//  InterstitialTestViewController.m
//  iOS_AutoTest
//
//  Created by Hammer on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "InterstitialTestViewController.h"
@import AdLimeSdk;
#import "Masonry.h"
#import "util/macro.h"
#import "util/UIView+Toast.h"

@interface InterstitialTestViewController () <AdLimeInterstitialAdDelegate>

@property (nonatomic, strong) AdLimeInterstitialAd *interstitalAd;
@property (nonatomic, strong) UIButton *showIntBtn;

@end

@implementation InterstitialTestViewController

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
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    [testloadIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(header.mas_bottom).offset(10);
        make.width.equalTo(@(150));
        make.height.equalTo(@(20));
    }];
    
    [testshowIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-30);
        make.top.equalTo(header.mas_bottom).offset(10);
        make.width.equalTo(@(150));
        make.height.equalTo(@(20));
    }];
    
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma  mark intersitial
- (void) loadInteristial {
    if (!useAdLoader) {
        if (self.interstitalAd == nil) {
            self.interstitalAd = [[AdLimeInterstitialAd alloc] initWithAdUnitId:self.adUnitID];
            self.interstitalAd.delegate = self;
        }
        [self.interstitalAd loadAd];
    } else {
        [AdLimeAdLoader getInterstitialAd:self.adUnitID].delegate = self;
        [AdLimeAdLoader loadInterstitialAd:self.adUnitID];
    }
        
}

- (void)showInterstitial {
    if (!useAdLoader) {
        if (self.interstitalAd.isReady)
        {
            [self.interstitalAd showFromViewController:self];
        }
    } else {
        if ([AdLimeAdLoader isInterstitialAdReady:self.adUnitID]) {
            [AdLimeAdLoader showInterstitialAd:self.adUnitID viewController:self];
        }
    }
}

#pragma mark <WECreativeInterstitialDelegate>
- (void)adLimeInterstitialDidReceiveAd:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialDidReceiveAd, interstitialAd.adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = YES;
}

- (void)adLimeInterstitial:(AdLimeInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(AdLimeAdError *)adError{
    NSLog(@"AdLimeInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
     [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)adLimeInterstitialWillPresentScreen:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialWillPresentScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void)adLimeInterstitialDidDismissScreen:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialDidDismissScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = NO;
}

- (void)adLimeInterstitialWillLeaveApplication:(AdLimeInterstitialAd *)interstitialAd {
    NSLog(@"AdLimeInterstitialAd adLimeInterstitialWillLeaveApplication, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
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
