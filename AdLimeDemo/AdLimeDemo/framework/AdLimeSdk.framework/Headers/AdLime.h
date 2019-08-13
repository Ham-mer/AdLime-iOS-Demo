//
//  AdLime.h
//  Sdk 初始化的接口。

#import <Foundation/Foundation.h>

@interface AdLime : NSObject

// 使用 AppId 初始化 Sdk
+ (void) initWithAppId: (NSString *)appId;
+ (NSString *)getAppId;

+ (void)setTestMode:(BOOL)testMode;
+ (void)setLogEnable:(BOOL)enable;

// 设置用户是否同意了 Gdpr
+ (void) setGdprConsent: (BOOL) consent;
+ (BOOL) isGdprConsent;

@end
