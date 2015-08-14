//
//  DEMOSecondViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOSecondViewController.h"
#import <bongSDK/bongSDK.h>

@interface DEMOSecondViewController ()

@property (nonatomic,strong) UIButton *bongLoginButton;

@end

@implementation DEMOSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Second Controller";
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:101/255.0 alpha:1.0];
     UIBarButtonItem *leftBarButton= [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    UIBarButtonItem *closeBarButton=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeBarButtonAction:)];
    
    self.navigationItem.leftBarButtonItems=@[leftBarButton,closeBarButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(presentRightMenuViewController:)];
    
    [self.view addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 84, self.view.frame.size.width, 44);
        button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [button setTitle:@"Push View Controller" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    self.bongLoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.bongLoginButton.frame = CGRectMake(0, 84, self.view.frame.size.width, 44);
    self.bongLoginButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.bongLoginButton setTitle:@"bong授权" forState:UIControlStateNormal];
    [self.bongLoginButton addTarget:self action:@selector(bongLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.bongLoginButton.center=self.view.center;
    [self.view addSubview:self.bongLoginButton];
}

-(void)closeBarButtonAction:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)bongLoginAction:(id)sender{
    if ([bongSDK isAuthorizationValid]) {
        NSLog(@"授权成功");
    }else{
        [bongSDK requestAuthorization];
    }
}

- (void)pushViewController:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"Pushed Controller";
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"DEMOSecondViewController will appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"DEMOSecondViewController will disappear");
}

@end
