//
//  AdLimeBannerViewDelegate.h
//  iOS 广告回调。

#import <Foundation/Foundation.h>
#import "AdLimeAdError.h"
@class AdLimeBannerView;

@protocol AdLimeBannerViewDelegate<NSObject>

@optional
- (void)adLimeBannerDidReceiveAd:(AdLimeBannerView *)bannerView;

@optional
- (void)adLimeBanner:(AdLimeBannerView *)bannerView didFailToReceiveAdWithError:(AdLimeAdError *)adError;

@optional
- (void)adLimeBannerWillPresentScreen:(AdLimeBannerView *)bannerView;

@optional
- (void)adLimeBannerDidDismissScreen:(AdLimeBannerView *)bannerView;

@optional
- (void)adLimeBannerWillLeaveApplication:(AdLimeBannerView *)bannerView;

@end
