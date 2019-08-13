//
//  AdLimeNativeAdDelegate.h
//  Created by Matthew on 2019/6/20.
//

#import <Foundation/Foundation.h>
#import "AdLimeAdError.h"
@class AdLimeNativeAd;

@protocol AdLimeNativeAdDelegate<NSObject>

@optional
- (void)adLimeNativeAdDidReceiveAd:(AdLimeNativeAd *)nativeAd;

@optional
- (void)adLimeNativeAd:(AdLimeNativeAd *)nativeAd didFailToReceiveAdWithError:(AdLimeAdError *)adError;

@optional
- (void)adLimeNativeAdWillPresentScreen:(AdLimeNativeAd *)nativeAd;

@optional
- (void)adLimeNativeAdDidDismissScreen:(AdLimeNativeAd *)nativeAd;

@optional
- (void)adLimeNativeAdWillLeaveApplication:(AdLimeNativeAd *)nativeAd;

@end
