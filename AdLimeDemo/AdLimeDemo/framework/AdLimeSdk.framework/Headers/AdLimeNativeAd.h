//
//  AdLimeNativeAd.h
//  Created by Matthew on 2019/6/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdLimeNativeAdDelegate.h"
#import "AdLimeNativeAdLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdLimeNativeAd : NSObject

@property(nonatomic, readonly, nonnull) NSString *adUnitId;

- (AdLimeNativeAd *)initWithAdUnitId:(NSString *)adUnitId;
@property(nonatomic, weak, nullable) id<AdLimeNativeAdDelegate> delegate;

- (void)setNativeAdLayout:(AdLimeNativeAdLayout *)layout;
- (void)setHE;
- (void)loadAd;
- (BOOL)isReady;
- (UIView *)getAdView;
- (UIView *)getAdView:(AdLimeNativeAdLayout *)layout;
- (void)destroy;

@end

NS_ASSUME_NONNULL_END
