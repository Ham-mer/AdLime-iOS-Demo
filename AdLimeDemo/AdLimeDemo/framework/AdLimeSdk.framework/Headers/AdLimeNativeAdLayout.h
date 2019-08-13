//
//  AdLimeNativeAdLayout.h
//  Created by Matthew on 2019/6/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdLimeInteractiveArea.h"

// 设置评分
typedef void (^ratingCallback)(double rating);

@interface AdLimeNativeAdLayout : NSObject

@property UIView *rootView;

@property UILabel *titleLabel;
@property UILabel *subTitleLabel;
@property UILabel *bodyLabel;
@property UILabel *advertiserLabel;
// CallToAction 可以设置 Label 或 Button
@property UIView *callToActionView;

@property UIView *iconView;
@property UIView *mediaView;
@property UIView *adChoicesView;

@property UILabel *ratingLabel;
@property UIView *ratingView;

@property UILabel *priceLabel;
@property UILabel *storeLabel;

@property ratingCallback ratingCallback;

@property AdLimeInteractiveArea *interactiveArea;

-(UIView *)getRatingView;

-(void)setImage:(UIImageView *)imageView withUrl:(NSString *)url;

-(void)updateTitle:(NSString *)title;
-(void)updateSubTitle:(NSString *)subTitle;
-(void)updateBody:(NSString *)body;
-(void)updateAdvertiser:(NSString *)advertiser;
-(void)updateCallToAction:(NSString *)callToAction;

-(void)updateIconView:(UIView *)view;
-(void)updateIconImage:(UIImage *)image;
-(void)updateIconImageUrl:(NSString *)url;

-(void)updateMediaView:(UIView *)view;
-(void)updateMediaImage:(UIImage *)image;
-(void)updateMediaImageUrl:(NSString *)url;

-(void)updateAdChoicesView:(UIView *)view;
-(void)updateAdChoicesImage:(UIImage *)image;
-(void)updateAdChoicesImageUrl:(NSString *)url;
// -(void)updateAdChoicesText:(NSString *)text;

-(void)updateRatingDouble:(double)rating;
-(void)updatePrice:(NSString *)price;
-(void)updateStore:(NSString *)store;

-(void)hideAll;
-(NSMutableArray *)getAllViewArray;
-(NSMutableArray *)getNonMediaViewArray;

-(NSMutableArray *)getInteractiveViewArray;

@end
