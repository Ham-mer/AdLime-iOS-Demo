//
//  AdLimeTrackerInfo.h
//  Created by Matthew on 2019/7/14.
//

#import <Foundation/Foundation.h>
#import "AdLimeILineItem.h"

@interface AdLimeTrackerInfo : NSObject

@property float eCPM;
@property int networkId;
@property NSString *lineItemAdUnitId;
@property NSString *adUnitId;
@property int adType;

- (AdLimeTrackerInfo *)initWithLineItem:(AdLimeILineItem *)lineItem;

@end
