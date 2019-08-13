//
//  AdLimeInteractiveArea.h
//  AdLimeSdk
//
//  Created by Matthew on 2019/8/7.
//  Copyright © 2019年 AdLime. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, AdLimeInteractiveView) {
    ADLIME_INTERACTIVE_VIEW_TITLE = 1 << 0,
    ADLIME_INTERACTIVE_VIEW_SUBTITLE = 1 << 1,
    ADLIME_INTERACTIVE_VIEW_BODY =  1 << 2,
    ADLIME_INTERACTIVE_VIEW_ADVERTISER = 1 << 3,
    ADLIME_INTERACTIVE_VIEW_CALL_TO_ACTION = 1 << 4,
    ADLIME_INTERACTIVE_VIEW_ICON = 1 << 5,
    ADLIME_INTERACTIVE_VIEW_MEDIAVIEW = 1 << 6,
    ADLIME_INTERACTIVE_VIEW_ADCHOICES = 1 << 7,
    ADLIME_INTERACTIVE_VIEW_RATING_VIEW = 1 << 8,
    ADLIME_INTERACTIVE_VIEW_RATING_LABEL = 1 << 9,
    ADLIME_INTERACTIVE_VIEW_PRICE = 1 << 10,
    ADLIME_INTERACTIVE_VIEW_STORE = 1 << 11
};

@interface AdLimeInteractiveArea : NSObject

+(AdLimeInteractiveArea *)builder;
+(AdLimeInteractiveArea *)allArea;

-(AdLimeInteractiveArea *)addTitle;
-(AdLimeInteractiveArea *)addSubTitle;
-(AdLimeInteractiveArea *)addBody;
-(AdLimeInteractiveArea *)addAdvertiser;
-(AdLimeInteractiveArea *)addCallToAction;
-(AdLimeInteractiveArea *)addIcon;
-(AdLimeInteractiveArea *)addMediaView;
-(AdLimeInteractiveArea *)addAdChoices;
-(AdLimeInteractiveArea *)addRatingView;
-(AdLimeInteractiveArea *)addRatingLabel;
-(AdLimeInteractiveArea *)addPrice;
-(AdLimeInteractiveArea *)addStore;

-(BOOL)hasTitle;
-(BOOL)hasSubTitle;
-(BOOL)hasBody;
-(BOOL)hasAdvertiser;
-(BOOL)hasCallToAction;
-(BOOL)hasIcon;
-(BOOL)hasMediaView;
-(BOOL)hasAdChoices;
-(BOOL)hasRatingView;
-(BOOL)hasRatingLabel;
-(BOOL)hasPrice;
-(BOOL)hasStore;

@end
