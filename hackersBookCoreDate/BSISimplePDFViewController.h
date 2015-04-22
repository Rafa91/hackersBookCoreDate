//
//  BSISimplePDFViewController.h
//  hackerBooks
//
//  Created by Rafael Navarro on 3/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSIPdf;

@interface BSISimplePDFViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webPDF;
@property (strong, nonatomic) BSIPdf *model;

-(id) initWithModel: (BSIPdf *) model;

@end
