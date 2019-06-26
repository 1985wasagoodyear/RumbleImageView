//
//  RumbleImageView.m
//  RumbleImageView
//
//  Created by K Y on 6/26/19.
//  Copyright © 2019 KY. All rights reserved.
//

#import "RumbleImageView.h"

#define kRumbleAnimationKey @"kRumbleAnimationKey"
#define kAnimationIterationDuration 1.0
#define kAnimationPositionsCount 15
#define kAnimationVariationMax 100

@interface RumbleImageView () <CAAnimationDelegate>

@property (nonatomic) BOOL isRumbling;

@end

@implementation RumbleImageView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _animationIterationDuration = kAnimationIterationDuration;
        _animationPositionsCount = kAnimationPositionsCount;
        _animationVariationMax = kAnimationVariationMax;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _animationIterationDuration = kAnimationIterationDuration;
        _animationPositionsCount = kAnimationPositionsCount;
        _animationVariationMax = kAnimationVariationMax;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        _animationIterationDuration = kAnimationIterationDuration;
        _animationPositionsCount = kAnimationPositionsCount;
        _animationVariationMax = kAnimationVariationMax;
    }
    return self;
}

- (void)startRumbles {
    self.isRumbling = YES;
    [self startRumblesHelper];
}

- (void)startRumblesHelper {
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.delegate = self;
    group.removedOnCompletion = NO;
    group.duration = _animationIterationDuration;
    [group setValue:kRumbleAnimationKey forKey:@"key"];
    [group setFillMode:kCAFillModeBackwards];
    
    CAKeyframeAnimation *yAnim = [[CAKeyframeAnimation alloc] init];
    yAnim.keyPath = @"position.y";
    yAnim.values = [self randomYPositions];
    
    CAKeyframeAnimation *xAnim = [[CAKeyframeAnimation alloc] init];
    xAnim.keyPath = @"position.x";
    xAnim.values = [self randomXPositions];
    
    [group setAnimations:@[yAnim, xAnim]];
    [self.layer addAnimation:group
                      forKey:kRumbleAnimationKey];
}

- (NSArray *)randomXPositions {
    NSMutableArray *pos = [[NSMutableArray alloc] initWithCapacity:_animationPositionsCount];
    int width = (self.frame.size.width - _animationVariationMax) / 2;
    for (int i = 0; i < _animationPositionsCount; i++) {
        int uInt = arc4random_uniform((int)_animationVariationMax);
        NSNumber *num = [NSNumber numberWithInt:uInt + width];
        [pos addObject:num];
    }
    return [pos copy];
}

- (NSArray *)randomYPositions {
    NSMutableArray *pos = [[NSMutableArray alloc] initWithCapacity:_animationPositionsCount];
    int height = (self.frame.size.height - _animationVariationMax) / 2;
    for (int i = 0; i < _animationPositionsCount; i++) {
        int uInt = arc4random_uniform((int)_animationVariationMax);
        NSNumber *num = [NSNumber numberWithInt:uInt + height];
        [pos addObject:num];
    }
    return [pos copy];
}

- (void)stopRumbles {
    self.isRumbling = NO;
    [self.layer removeAllAnimations];
}

// MARK: - CAAnimationDelegate Methods

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAAnimation *rumbleAnimation = [self.layer animationForKey:kRumbleAnimationKey];
    if (flag == YES && [anim isEqual:rumbleAnimation]) {
        if (self.isRumbling == NO) {
            [self.layer removeAnimationForKey:kRumbleAnimationKey];
        }
        else {
            [self startRumblesHelper];
        }
    }
}


@end
