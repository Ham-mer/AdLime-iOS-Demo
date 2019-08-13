//
//  AdLimeRewardedVideoAdDelegate.h

//

#import <Foundation/Foundation.h>
#import "AdLimeAdError.h"
#import "AdLimeRewardItem.h"

@protocol AdLimeInnerRewardedVideoAdDelegate<NSObject>

- (void)rewardedVideoDidReceiveAd:(NSString *)lineItemId;
- (void)rewardedVideoDidOpen:(NSString *)lineItemId;
- (void)rewardedVideoWillLeaveApplication:(NSString *)lineItemId;
- (void)rewardedVideoDidClose:(NSString *)lineItemId;
- (void)rewardedVideo:(NSString *)lineItemId didFailToReceiveAdWithError:(AdLimeAdError *)adError;
- (void)rewardedVideoDidStart:(NSString *)lineItemId;
- (void)rewardedVideoDidComplete:(NSString *)lineItemId;
- (void)rewardedVideo:(NSString *)lineItemId didReward:(AdLimeRewardItem *)item;
- (void)rewardedVideoDidFailedToReward:(NSString *)lineItemId;

@end
