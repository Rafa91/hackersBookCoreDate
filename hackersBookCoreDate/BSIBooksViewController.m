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

@interface BSIBooksViewController ()

@end

@implementation BSIBooksViewController

-(void) viewDidLoad{
    
    [super viewDidLoad];
    self.title = @"Hackers Book";
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar cual es el libro
    BSIBook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
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

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //inmediatamente lo elimino del modelo
        
        //averiguar la libro
        BSIBook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //eliminarla
        [self.fetchedResultsController.managedObjectContext deleteObject:b];
        
        
    }
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BSIBook *aBook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    

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
