//
//  RewardedVideoTestViewController.m
//  iOS_AutoTest
//
//  Created by Hammer on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "RewardedVideoTestViewController.h"
@import AdLimeSdk;
#import "Masonry.h"
#import "util/macro.h"
#import "util/UIView+Toast.h"

@interface RewardedVideoTestViewController () <AdLimeRewardedVideoAdDelegate>

@property (nonatomic, strong) AdLimeRewardedVideoAd *rewardAd;
@property (nonatomic, strong) UIButton *showRewardBtn;

@end

@implementation RewardedVideoTestViewController

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
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loadRewardBtn];
    [loadRewardBtn setTitle:@"load Reward" forState:UIControlStateNormal];
    //[loadRewardBtn setBackgroundColor:[UIColor blueColor]];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadRewardBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rewardShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:rewardShowBtn];
    [rewardShowBtn setTitle:@"show Reward" forState:UIControlStateNormal];
    //[rewardShowBtn setBackgroundColor:[UIColor blueColor]];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [rewardShowBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [rewardShowBtn addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    self.showRewardBtn = rewardShowBtn;
    self.showRewardBtn.enabled = NO;
    
    [loadRewardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(header.mas_bottom).offset(10);
        make.width.equalTo(@(150));
        make.height.equalTo(@(20));
    }];
    
    [rewardShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-30);
        make.top.equalTo(header.mas_bottom).offset(10);
        make.width.equalTo(@(150));
        make.height.equalTo(@(20));
    }];
    
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadReward {
    if (!useAdLoader) {
        if (self.rewardAd == nil) {
            self.rewardAd = [[AdLimeRewardedVideoAd alloc] initWithAdUnitId:self.adUnitID];
            self.rewardAd.delegate = self;
        }
        [self.rewardAd loadAd];
    } else {
        [AdLimeAdLoader loadRewardedVideoAd:self.adUnitID withDelegate:self];
    }
}

- (void)showReward {
    if (!useAdLoader) {
        if (self.rewardAd.isReady)
        {
            [self.rewardAd showFromViewController:self];
        }
    } else {
        if ([AdLimeAdLoader isRewardedVideoAdReady:self.adUnitID]) {
            [AdLimeAdLoader showRewardedVideoAd:self.adUnitID viewController:self];
        }
    }
}

- (void)adLimeRewardedVideoDidReceiveAd:(AdLimeRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidReceiveAd, rewardedVideoAd.adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = YES;
}


- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(AdLimeAdError *)adError {
    NSLog(@"adLimeRewardedVideo didFailToReceiveAdWithError %d",(int)[adError getCode]);
     [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)adLimeRewardedVideoDidStart:(AdLimeRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidStart, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)adLimeRewardedVideoDidClose:(AdLimeRewardedVideoAd *)rewardedVideoAd{
    NSLog(@"adLimeRewardedVideo adLimeRewardedVideoDidComplete, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = NO;
}

- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didReward:(AdLimeRewardItem *)item {
    NSLog(@"adLimeRewardedVideo did reward, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
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
