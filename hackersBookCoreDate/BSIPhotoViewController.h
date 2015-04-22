//
//  BSIPhotoViewController.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 21/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSIPhoto;
@interface BSIPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(id) initWithModel:(BSIPhoto *) model;

- (IBAction)takePhoto:(id)sender;

- (IBAction)deletePhoto:(id)sender;


@end
