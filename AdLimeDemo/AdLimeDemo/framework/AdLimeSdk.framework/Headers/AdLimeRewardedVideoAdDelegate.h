//
//  AdLimeRewardedVideoAdDelegate.h

//
//  iOS 广告回调。

#import <Foundation/Foundation.h>
#import "AdLimeAdError.h"
#import "AdLimeRewardItem.h"
@class AdLimeRewardedVideoAd;

@protocol AdLimeRewardedVideoAdDelegate<NSObject>

@optional
- (void)adLimeRewardedVideoDidReceiveAd:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideoDidOpen:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideoWillLeaveApplication:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideoDidClose:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(AdLimeAdError *)adError;

@optional
- (void)adLimeRewardedVideoDidStart:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideoDidComplete:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@optional
- (void)adLimeRewardedVideo:(AdLimeRewardedVideoAd *)rewardedVideoAd didReward:(AdLimeRewardItem *)item;

@optional
- (void)adLimeRewardedVideoDidFailedToReward:(AdLimeRewardedVideoAd *)rewardedVideoAd;

@end
