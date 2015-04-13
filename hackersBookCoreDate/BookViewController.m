//
//  BookViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 11/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BookViewController.h"
#import "BSIBook.h"
#import "BSIPhoto.h"
#import "BSIBooksViewController.h"

@interface BookViewController ()

@end

@implementation BookViewController

#pragma mark - inits
-(id) initWithModel: (BSIBook *)model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
    
}


#pragma mark -life cycles
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - actions
- (IBAction)readBook:(id)sender {
}

- (IBAction)changeStateFavorite:(id)sender {
    
    if (self.model.isFavorite) {
        [self.model setIsFavoriteValue:NO];
    }else{
        [self.model setIsFavoriteValue:YES];
    }
    
}

#pragma mark - delegates
-(void) booksViewController:(BSIBooksViewController *)libVC didSelectedBook:(BSIBook *)aBook{
    
    self.model=aBook;
    [self updateView];
    
}


#pragma mark - utils
-(void)updateView{
    
    self.title = self.model.titleBook;
    self.titleLabelView.text = self.model.titleBook;
    self.authorLabelView.text = [self.model authorDescription];
    self.tagLabelView.text = [self.model tagsDescription];
    self.frontPageView.image = [[self.model frontPage] image];
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
}



@end
