//
//  macro.h
//  AdLime_iOS_TestApp
//
//  Created by Hammer on 2019/9/25.
//  Copyright © 2019 we. All rights reserved.
//

#ifndef macro_h
#define macro_h


#define ScreenWidth             UIScreen.mainScreen.bounds.size.width
#define ScreenHeight            UIScreen.mainScreen.bounds.size.height

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONEX [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f && IS_IPHONE

#define kTopBarSafeHeight   (CGFloat)(IS_IPHONEX?(64):(20))
#define kBottomSafeHeight   (CGFloat)(IS_IPHONEX?(34):(0))

#define useAdLoader 1

#endif /* macro_h */
