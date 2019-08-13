//
//  AdLimeRewardedVideoAd.h

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdLimeTypes.h"
#import "AdLimeRewardedVideoAdDelegate.h"
#import "AdLimeInnerRewardedVideoAdDelegate.h"

@interface AdLimeRewardedVideoAd : NSObject<AdLimeInnerRewardedVideoAdDelegate>

@property(nonatomic, readonly, nonnull) NSString *adUnitId;

/// iOS Start
- (nonnull id)initWithAdUnitId:(nonnull NSString *)adUnitId;
@property(nonatomic, weak, nullable) id<AdLimeRewardedVideoAdDelegate> delegate;
/// iOS End

/// Unity Start
- (nonnull id)initWithRewardedVideoClientReference:(AdLimeTypeRewardedVideoClientRef *)rewardedVideoClient adUnitId:(NSString *)adUnitId;
@property(nonatomic, assign) AdLimeTypeRewardedVideoClientRef *rewardedVideoClient;
/// The ad callback into Unity.
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidReceiveAdCallback didReceivedCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidOpenCallback didOpenCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoWillLeaveApplicationCallback willLeaveCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidCloseCallback didCloseCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidFailToReceiveAdWithErrorCallback didFailToReceiveAdCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidStartCallback didStartCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidCompleteCallback didCompleteCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidRewardCallback didRewardCallback;
@property(nonatomic, assign, nullable) AdLimeRewardVideoDidFailedToRewardCallback didFailedToRewardCallback;
/// Unity End

- (void)setHE;
- (void)setCL:(int)cacheCount;
- (void)loadAd;
- (BOOL)isReady;
- (void)destroy;

/// iOS Start
- (void)showFromViewController:(nullable UIViewController *)viewController;
/// iOS End

/// Unity Start
- (void)showUnity;
- (void)showUnity:(nullable int [])networkIds;
/// Unity End

@end
