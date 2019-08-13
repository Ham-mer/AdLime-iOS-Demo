//
//  AdLimeInterstitialAdDelegate.h

//

#import <Foundation/Foundation.h>
#import "AdLimeAdError.h"

@protocol AdLimeInnerInterstitialAdDelegate<NSObject>

- (void)interstitialDidReceiveAd:(NSString *)lineItemId;
- (void)interstitial:(NSString *)lineItemId didFailToReceiveAdWithError:(AdLimeAdError *)adError;
- (void)interstitialWillPresentScreen:(NSString *)lineItemId;
- (void)interstitialDidDismissScreen:(NSString *)lineItemId;
- (void)interstitialWillLeaveApplication:(NSString *)lineItemId;

@end
