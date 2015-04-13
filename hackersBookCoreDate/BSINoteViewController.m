//
//  BSINoteViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 11/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSINoteViewController.h"
#import "BSINote.h"
#import "BSIPhoto.h"

@interface BSINoteViewController ()

@end

@implementation BSINoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Notes";
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar cual es la nota
    BSINote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Crear una celda
    static NSString *cellID= @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellID];
    }
    
    //Configurarla (sincronizar libro y celda)
    cell.textLabel.text = n.name;
    cell.detailTextLabel.text = n.text;
    cell.imageView.image = [n.image image];
    
    
    //devolverla
    return cell;
    
}

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //inmediatamente lo elimino del modelo
        
        //averiguar la libro
        BSINote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //eliminarla
        [self.fetchedResultsController.managedObjectContext deleteObject:n];
        
        
    }
    
}

//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    BSIBook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    
//    
//    [self.navigationController pushViewController:[[BookViewController alloc]initWithModel:b]
//                                         animated:YES];
//}


@end
