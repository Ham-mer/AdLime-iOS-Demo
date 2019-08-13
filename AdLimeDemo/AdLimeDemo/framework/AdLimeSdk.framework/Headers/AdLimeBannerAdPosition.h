//
//  AdLimeBannerAdPosition.h
//

/// Positions to place an banner ad on Unity Platform.
typedef NS_ENUM(NSInteger, AdLimeBannerAdPosition) {
    AdLimeBannerAdPos_Custom = -1,      // Custom ad position: (x,y)
    AdLimeBannerAdPos_Top = 0,          // Top of screen.
    AdLimeBannerAdPos_Bottom = 1,       // Bottom of screen.
    AdLimeBannerAdPos_TopLeft = 2,      // Top left of screen.
    AdLimeBannerAdPos_TopRight = 3,     // Top right of screen.
    AdLimeBannerAdPos_BottomLeft = 4,   // Bottom left of screen.
    AdLimeBannerAdPos_BottomRight = 5,  // Bottom right of screen.
    AdLimeBannerAdPos_Center = 6        // Center of screen.
};
