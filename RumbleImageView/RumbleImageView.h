//
//  RumbleImageView.h
//  RumbleImageView
//
//  Created by K Y on 6/26/19.
//  Copyright © 2019 KY. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for RumbleImageView.
FOUNDATION_EXPORT double RumbleImageViewVersionNumber;

//! Project version string for RumbleImageView.
FOUNDATION_EXPORT const unsigned char RumbleImageViewVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <RumbleImageView/PublicHeader.h>


@interface RumbleImageView : UIImageView

@property (nonatomic, readonly) BOOL isRumbling;
@property (nonatomic, assign) NSTimeInterval animationIterationDuration;
@property (nonatomic, assign) NSInteger animationPositionsCount;
@property (nonatomic, assign) NSInteger animationVariationMax;

- (void)startRumbles;
- (void)stopRumbles;

@end
