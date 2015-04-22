//
//  BSINotesViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 19/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSINotesViewController.h"
#import "BSINote.h"
#import "BSINoteCollectionViewCell.h"
#import "BSIPhoto.h"
#import "BSINoteViewController.h"
#import "BSIBook.h"

static NSString *cellId = @"NoteCellId";

@interface BSINotesViewController ()

@end

@implementation BSINotesViewController

#pragma mark - view LifeCycle
-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self registerNib];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95
                                                            alpha:1];
    self.title = @"Notas";
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNote:)];
    self.navigationItem.rightBarButtonItem = add;
    
}

#pragma mark - Xib registration
-(void) registerNib{
    
    UINib *nib = [UINib nibWithNibName:@"BSINoteCollectionViewCell"
                                bundle:nil];
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:cellId];
    
}

#pragma mark -  Data Source
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //Obtener el objeto
    BSINote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Obtener una celda
    BSINoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                                forIndexPath:indexPath];
    [cell observeNote:n];
    //Devolverla
    return cell;
}

#pragma mark - Delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //Obtener el objeto
    BSINote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    BSINoteViewController *noteVC = [[BSINoteViewController alloc] initWithModel:n];
    
    [self.navigationController pushViewController:noteVC
                                         animated:YES];
    
}

#pragma mark - utils
-(void) addNewNote: (id) sender{
    
    BSINoteViewController *noteVC = [[BSINoteViewController alloc] initForNewNoteInBook:self.book];
    [self.navigationController pushViewController:noteVC
                                         animated:YES];
    
}

@end
