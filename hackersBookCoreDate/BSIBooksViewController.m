//
//  BSIBooksViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 10/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSIBooksViewController.h"
#import "BookViewController.h"
#import "BSIBook.h"
#import "BSIPhoto.h"
#import "Settings.h"
#import "BSITag.h"

@interface BSIBooksViewController ()

@end

@implementation BSIBooksViewController

-(void) viewDidLoad{
    
    [super viewDidLoad];
    self.title = @"Hackers Book";
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [[[self.fetchedResultsController.fetchedObjects objectAtIndex:section] books] count];

}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BSITag *t = [self.fetchedResultsController.fetchedObjects objectAtIndex:[indexPath section]];
    BSIBook *b = [[t.books allObjects] objectAtIndex: [indexPath row]];
    
    //Crear una celda
    static NSString *cellID= @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellID];
    }
    
    //Configurarla (sincronizar libro y celda)
    cell.textLabel.text = b.titleBook;
    cell.detailTextLabel.text = [b tagsDescription];
    cell.imageView.image = b.frontPage.image;
    
    
    //devolverla
    return cell;
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BSITag *t = [self.fetchedResultsController.fetchedObjects objectAtIndex:[indexPath section]];
    BSIBook *aBook = [[t.books allObjects] objectAtIndex: [indexPath row]];
    

    if ([self.delegate respondsToSelector:@selector(booksViewController:didSelectedBook:) ]) {
        [self.delegate booksViewController:self
                           didSelectedBook:aBook];
    }
    
    //ultimo libro seleccionado
    NSData *dataURL = [aBook archiveURIRepresentation];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:dataURL
            forKey:LAST_SELECTED_BOOK];
    [def synchronize];

}

-(void)booksViewController:(BSIBooksViewController *)libVC didSelectedBook:(BSIBook *)aBook{
    
    BookViewController *bookVC = [[BookViewController alloc] initWithModel:aBook];
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
    
    
}
@end
