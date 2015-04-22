//
//  BSINotesViewController.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 19/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"
@class BSIBook;
@interface BSINotesViewController : AGTCoreDataCollectionViewController
@property (nonatomic, strong) BSIBook *book;
@end
