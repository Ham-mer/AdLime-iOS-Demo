//
//  AdLimeTrackerDelegate.h
//  Created by Matthew on 2019/7/14.
//

#import "AdLimeTrackerInfo.h"

@protocol AdLimeTrackerDelegate<NSObject>

// 请求广告
@optional
- (void)adLimeTrackAdRequest:(AdLimeTrackerInfo *)trackInfo;

// 请求广告成功
@optional
- (void)adLimeTrackAdLoaded:(AdLimeTrackerInfo *)trackInfo;

// App 展示广告
@optional
- (void)adLimeTrackAdCallShow:(AdLimeTrackerInfo *)trackInfo;

// 广告得到展示
@optional
- (void)adLimeTrackAdShown:(AdLimeTrackerInfo *)trackInfo;

// 点击广告
@optional
- (void)adLimeTrackAdClicked:(AdLimeTrackerInfo *)trackInfo;

// 广告关闭
@optional
- (void)adLimeTrackAdClosed:(AdLimeTrackerInfo *)trackInfo;

// 请求广告失败
@optional
- (void)adLimeTrackAdFailedToLoad:(AdLimeTrackerInfo *)trackInfo;

// 激励视频开始播放
@optional
- (void)adLimeTrackAdVideoStarted:(AdLimeTrackerInfo *)trackInfo;

// 激励视频播放结束
@optional
- (void)adLimeTrackAdVideoCompleted:(AdLimeTrackerInfo *)trackInfo;

// 激励成功
@optional
- (void)adLimeTrackAdRewarded:(AdLimeTrackerInfo *)trackInfo;

// 激励失败
@optional
- (void)adLimeTrackAdRewardFailed:(AdLimeTrackerInfo *)trackInfo;

@end
