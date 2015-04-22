//
//  BookViewController.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 11/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

@import UIKit;
@class BSIBook;
#import "BSIBooksViewController.h"

@interface BookViewController : UIViewController <BSIBooksViewControllerDelegate>

@property (strong, nonatomic) BSIBook *model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabelView;
@property (weak, nonatomic) IBOutlet UILabel *tagLabelView;
@property (weak, nonatomic) IBOutlet UIImageView *frontPageView;

-(id) initWithModel: (BSIBook *)model;

- (IBAction)readBook:(id)sender;

- (IBAction)changeStateFavorite:(id)sender;
- (IBAction)displayNotes:(id)sender;

@end
