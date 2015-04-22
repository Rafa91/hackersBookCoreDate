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
#import "BSITag.h"
#import "BSINote.h"
#import "BSINotesViewController.h"

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

    //Crear el fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSINote entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.name
                                                          ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.modificationDate
                                                          ascending:NO],
                            [NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.creationDate
                                                          ascending:NO]];
    req.predicate = [NSPredicate predicateWithFormat:@"book = %@", self.model];
    //Crear el fetchedResultsController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.model.managedObjectContext
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    //Crear el layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(140, 150);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    //Crear el controlador de notas
    BSINotesViewController *notesVC = [BSINotesViewController coreDataCollectionViewControllerWithFetchedResultsController:fc
                                                                                                                    layout:layout];
    notesVC.book = self.model;
    
    //lo pusheamos
    [self.navigationController pushViewController:notesVC
                                         animated:YES];

}

- (IBAction)changeStateFavorite:(id)sender {
    
    if (self.model.isFavoriteValue) {
        [self.model setIsFavoriteValue:NO];
    }else{
        [self.model setIsFavoriteValue:YES];
    }
    NSString *name = @"Favorite";
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSITag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSITagAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    req.predicate= [NSPredicate predicateWithFormat:@"name == %@",name];
    NSError *error;
    NSArray *result = [self.model.managedObjectContext executeFetchRequest:req
                                                               error:&error];
    if (self.model.isFavoriteValue) {
        if ([result count] != 0) {
            [self.model addTagsObject:[result lastObject]];
        }else{
            [self.model addTagsObject:[BSITag tagWithName:name
                                                  context:self.model.managedObjectContext]];
        }
        
    }else{
        [self.model.managedObjectContext deleteObject:[result lastObject]];
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
