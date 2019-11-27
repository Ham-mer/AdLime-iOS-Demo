//
//  BannerTestViewController.h
//  iOS_AutoTest
//
//  Created by Hammer on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ADLIME_BANNER_SIZE) {
    ADLIME_BANNER_SIZE_320_50 = 0,
    ADLIME_BANNER_SIZE_300_250,
    ADLIME_BANNER_SIZE_320_100,
    ADLIME_BANNER_SIZE_468_60,
    ADLIME_BANNER_SIZE_728_90,
};


NS_ASSUME_NONNULL_BEGIN

@interface BannerTestViewController : UIViewController

@property (nonatomic, strong) NSString *adUnitID;
@property (nonatomic, strong) NSString *titleStr;

@property (nonatomic) ADLIME_BANNER_SIZE bannerSize;

@end

NS_ASSUME_NONNULL_END
