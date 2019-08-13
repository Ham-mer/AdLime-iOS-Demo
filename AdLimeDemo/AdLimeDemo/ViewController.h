//
//  ViewController.h
//  wesdk_ios_demo
//
//  Created by we on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import <UIKit/UIKit.h>


#define ScreenWidth             UIScreen.mainScreen.bounds.size.width
#define ScreenHeight            UIScreen.mainScreen.bounds.size.height

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONEX [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f && IS_IPHONE

// 顶部安全区域远离高度
#define kTopBarSafeHeight   (CGFloat)(IS_IPHONEX?(44):(0))
// 底部安全区域远离高度
#define kBottomSafeHeight   (CGFloat)(IS_IPHONEX?(34):(0))

@interface ViewController : UIViewController


@end

