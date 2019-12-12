//
//  HomeViewController.m
//  AdLime_iOS_AutoTest
//
//  Created by Hammer on 2019/9/27.
//  Copyright © 2019 we. All rights reserved.
//

#import "HomeViewController.h"
#import "util/macro.h"
#import <Masonry.h>
#import "LoadModelViewController.h"
#import "NetworkTestViewController.h"
#import "AdTypeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.modalPresentationStyle = 0;
    
    UIButton *testBaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testBaseBtn];
    [testBaseBtn setTitle:@"Basic Test" forState:UIControlStateNormal];
    [testBaseBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBaseBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testBaseBtn addTarget:self action:@selector(testBase) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testNetworkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testNetworkBtn];
    [testNetworkBtn setTitle:@"Network Test" forState:UIControlStateNormal];
    [testNetworkBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testNetworkBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testNetworkBtn addTarget:self action:@selector(testNetwork) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testMediationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testMediationBtn];
    [testMediationBtn setTitle:@"Load Model Test" forState:UIControlStateNormal];
    [testMediationBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testMediationBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testMediationBtn addTarget:self action:@selector(testMediation) forControlEvents:UIControlEventTouchUpInside];
    
    [testBaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testNetworkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testMediationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
}

- (void) testBase {
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    NSArray *ads = @[@[@"Banner", @"52040363-01ed-44c3-b204-154e28cd0a4d"], @[@"Banner_300*250", @"573c18f4-7472-4987-b718-c124b154675f"],  @[@"Interstitial", @"03e88f50-f414-41dd-ba19-3702fd360b4c"], @[@"Native", @"d47cd3c3-b8a7-4902-871a-2a8ca5657626"], @[@"RewardedVideo", @"8ef45a9e-74cf-4fa6-84d8-3c07fdedc0c7"], @[@"MixView", @"59445d92-28af-41b1-9a3f-7c2a192a3bda"], @[@"MixFullScreen", @"c9d0819a-deef-4bd2-b038-b8686ffd82be"]];
    vc.adsDic = ads;
    vc.titleStr = @"Basic Test";
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testNetwork {
    NetworkTestViewController *vc = [[NetworkTestViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testMediation {
    LoadModelViewController *vc = [[LoadModelViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
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
