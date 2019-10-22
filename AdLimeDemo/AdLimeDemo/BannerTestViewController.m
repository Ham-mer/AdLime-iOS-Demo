//
//  BannerTestViewController.m
//  iOS_AutoTest
//
//  Created by 汤正 on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "BannerTestViewController.h"
@import AdLimeSdk;
#import "Masonry.h"
#import "macro.h"

@interface BannerTestViewController () <AdLimeBannerViewDelegate>

@property (nonatomic, strong) AdLimeBannerView *bannerAd;
@property (nonatomic, strong) UIView *banner;

@end

@implementation BannerTestViewController

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
    
    UIButton *testBannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBannerBtn.frame = CGRectMake((ScreenWidth-200)/2, kTopBarSafeHeight+50, 200, 30);
    [self.view addSubview:testBannerBtn];
    [testBannerBtn setTitle:@"load banner" forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testBannerBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testBannerBtn addTarget:self action:@selector(testBanner) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *banner = [[UIView alloc] init];
    [banner setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:banner];
    
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(testBannerBtn.mas_bottom).offset(80);
        if (self.bannerSize == ADLIME_BANNER_SIZE_300_250) {
            make.height.equalTo(@(250));
        } else {
            make.height.equalTo(@(50));
        }
    }];
    
    self.banner = banner;
    banner.hidden = YES;
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)testBanner {
    AdLimeBannerView *bannerView = [[AdLimeBannerView alloc] initWithAdUnitId:self.adUnitID rootViewController:self];
    bannerView.delegate = self;
    
    [self.banner addSubview:bannerView];
    
    [bannerView loadAd];
}

#pragma mark AdLimeBannerViewDelegate
- (void)adLimeBannerDidReceiveAd:(AdLimeBannerView *)bannerView{
    NSLog(@"AdLimeBannerView adLimeBannerDidReceiveAd, bannerView.adUnitId is %@", bannerView.adUnitId);
    self.banner.hidden = NO;
    
    self.bannerAd = bannerView;
//    CGFloat x = (ScreenWidth-320)/2;
//    bannerView.frame = CGRectMake(x, 10, 320, 50);
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.banner);
        if (self.bannerSize == ADLIME_BANNER_SIZE_300_250) {
            make.width.equalTo(@(300));
            make.height.equalTo(@(250));
        } else {
            make.width.equalTo(@(320));
            make.height.equalTo(@(50));
        }
    }];
}

- (void)adLimeBanner:(AdLimeBannerView *)bannerView didFailToReceiveAdWithError:(AdLimeAdError *)adError {
    NSLog(@"AdLimeBannerView didFailToReceiveAdWithError %d, adunitID: %@" , (int)[adError getCode], bannerView.adUnitId);
}

- (void)adLimeBannerWillPresentScreen:(AdLimeBannerView *)bannerView {
    NSLog(@"AdLimeBannerView adLimeBannerWillPresentScreen, adUnitId is %@", bannerView.adUnitId);
}

- (void)adLimeBannerDidDismissScreen:(AdLimeBannerView *)bannerView {
    NSLog(@"AdLimeBannerView adLimeBannerDidDismissScreen, adUnitId is %@", bannerView.adUnitId);
}


- (void)adLimeBannerWillLeaveApplication:(AdLimeBannerView *)bannerView {
    NSLog(@"AdLimeBannerView adLimeBannerWillLeaveApplication, adUnitId is %@", bannerView.adUnitId);
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
