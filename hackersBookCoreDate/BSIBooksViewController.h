//
//  BSIBooksViewController.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 10/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class BSIBooksViewController;
@class BSIBook;

@protocol BSIBooksViewControllerDelegate <NSObject>

@optional
-(void) booksViewController:(BSIBooksViewController *) libVC
            didSelectedBook:(BSIBook *) aBook;

@end

@interface BSIBooksViewController : AGTCoreDataTableViewController

@property (weak, nonatomic) id<BSIBooksViewControllerDelegate> delegate;

@end
