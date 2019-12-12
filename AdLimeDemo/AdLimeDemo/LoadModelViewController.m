//
//  LoadModelViewController.m
//  iOS_AutoTest
//
//  Created by Hammer on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "LoadModelViewController.h"
#import "util/macro.h"
#import <Masonry.h>
#import "AdTypeViewController.h"

@interface LoadModelViewController ()

@end

@implementation LoadModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.modalPresentationStyle = 0;
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [header addSubview:backBtn];
       
    [backBtn addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
    
    UIButton *SerilLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:SerilLoadBtn];
    [SerilLoadBtn setTitle:@"SerialLoad" forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    SerilLoadBtn.tag = 0;
    [SerilLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *parellLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:parellLoadBtn];
    [parellLoadBtn setTitle:@"ParallelLoad" forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    parellLoadBtn.tag = 1;
    [parellLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshuffleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testshuffleBtn];
    [testshuffleBtn setTitle:@"ShuffleLoad" forState:UIControlStateNormal];
    [testshuffleBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testshuffleBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    testshuffleBtn.tag = 2;
    [testshuffleBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    [SerilLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [parellLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testshuffleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
}

- (void) gotoBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) testLoadModel: (UIButton*) btn{
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    vc.modalPresentationStyle = 0;
    switch (btn.tag) {
        case 0:{
            NSArray *ads = @[@[@"Banner", @"11593002-54c8-4073-ae44-9e602497713e"], @[@"Interstitial", @"a86517a3-a6dd-49e0-bd13-4de18c2c2890"], @[@"Native", @"092153e3-15d6-47d6-8df2-312e084ea114"], @[@"RewardedVideo", @"d614a31c-5ca9-4bf0-aab0-e63e233febba"]];
            vc.adsDic = ads;
            vc.titleStr = @"Serial Load";
        }
            break;
        case 1: {
            NSArray *ads = @[@[@"Banner", @"1b046ba2-cd3f-48b9-87a0-f8420265bccf"], @[@"Interstitial", @"a86517a3-a6dd-49e0-bd13-4de18c2c2890"], @[@"Native", @"9fecf3e0-5948-41ce-80ea-2be49bf83319"], @[@"RewardedVideo", @"57671db6-9108-418b-8e4a-b7ff1851e721"]];
            vc.adsDic = ads;
            vc.titleStr = @"Parallel Test";
        }
            break;
        case 2:
        default: {
            NSArray *ads = @[@[@"Banner", @"8f6c480b-de3e-42ee-a19a-d19400d2c19a"], @[@"Interstitial", @"6e9f7a0c-21a1-4098-8747-05c20f1020a2"], @[@"Native", @"4de59549-9008-4a55-b40c-e866450128ca"], @[@"RewardedVideo", @"982b457f-c890-409e-a077-7473620c434b"]];
            vc.adsDic = ads;
            vc.titleStr = @"Suffle Test";
        }
            break;
    }
    
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
