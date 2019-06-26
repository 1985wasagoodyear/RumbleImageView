//
//  DriverViewController.m
//  RumbleImageViewDriver
//
//  Created by K Y on 6/26/19.
//  Copyright © 2019 KY. All rights reserved.
//

#import "DriverViewController.h"
#import <RumbleImageView/RumbleImageView.h>

@interface DriverViewController ()

@property (nonatomic, strong) RumbleImageView *imageView;

@end

@implementation DriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRumbleImageView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_imageView startRumbles];
}

- (void)setupRumbleImageView {
    _imageView = [[RumbleImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_imageView];
    [[_imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
    [[_imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];
    [[_imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:YES];
    [[_imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]  setActive:YES];
    [_imageView setImage:[UIImage imageNamed:@"chonk.jpg"]];
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
}

@end
