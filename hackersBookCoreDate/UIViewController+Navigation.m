//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Rafael Navarro on 8/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController * ) wrappedInNavigation{
    
    return [[UINavigationController alloc]initWithRootViewController:self];
    
}

@end
