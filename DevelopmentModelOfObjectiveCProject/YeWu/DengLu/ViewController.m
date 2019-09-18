//
//  ViewController.m
//  DevelopmentModelOfObjectiveCProject
//
//  Created by hrt03 on 2019/9/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:imgv];
    imgv.contentMode = UIViewContentModeScaleAspectFit;
    [imgv setImageWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ReactiveX/RxSwift/master/assets/Rx_Logo_M.png"]];
//    imgv.backgroundColor = UIColor.grayColor;
    
    
    
}


@end
