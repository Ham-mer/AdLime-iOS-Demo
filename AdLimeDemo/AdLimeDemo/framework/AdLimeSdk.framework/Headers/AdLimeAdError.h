//
//  AdError.h
//

#import "AdLimeNetwork.h"

typedef NS_ENUM(NSUInteger, AdLimeAdErrorCode) {
    ADLIME_ADERROR_INTERNAL_ERROR = 0, // 内部错误
    ADLIME_ADERROR_INVALID_REQUEST = 1, // 无效请求，请求过于频繁等，广告位无效等
    ADLIME_ADERROR_NETWORK_ERROR = 2, // 网络错误
    ADLIME_ADERROR_NO_FILL = 3, // 无广告填充
    ADLIME_ADERROR_TIMEOUT = 4 // 超时
};

@interface AdLimeAdError : NSObject

+(AdLimeAdError *)InternalError;
+(AdLimeAdError *)InvalidRequest;
+(AdLimeAdError *)NetworkError;
+(AdLimeAdError *)NoFill;
+(AdLimeAdError *)TimeOut;

-(AdLimeAdErrorCode)getCode;
-(AdLimeAdError *)appendErrorCode:(int)errorCode;
-(AdLimeAdError *)appendErrorMessage:(NSString *)message;
-(AdLimeAdError *)appendErrorCode:(int)errorCode withMessage:(NSString *)message;

-(AdLimeAdError *)innerMessage:(NSString *)message;
-(AdLimeAdError *)innerNetwork:(AdLimeNetwork *)network;
-(AdLimeAdError *)innerAdUnitName:(NSString *)adUnitName;
-(AdLimeAdError *)innerAdUnitId:(NSString *)adUnitId;
-(AdLimeAdError *)innerLineItemParams:(NSString *)lineItemParams;

@end
