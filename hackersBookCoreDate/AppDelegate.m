//
//  AppDelegate.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 10/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "BSINote.h"
#import "BSIBook.h"
#import "BSITag.h"
#import "BSIAuthor.h"
#import "BSIPhoto.h"
#import "BSIPdf.h"
#import "BSIBooksViewController.h"
#import "BookViewController.h"
#import "UIViewController+Navigation.h"
#import "Settings.h"
#import "AGTCoreDataStack+AGTCoreDataStack_DownloadedData.h"

@interface AppDelegate ()

@property (nonatomic, strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self configureFirstAppear];
    
    //[self addDummyData];
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSIBook entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSIBookAttributes.titleBook
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.stack.context
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    
    BSIBooksViewController *bsVC = [[BSIBooksViewController alloc] initWithFetchedResultsController:fc
                                                                                             style:UITableViewStylePlain];
    BookViewController *bVC= [self bookViewControllerWithLastBook];
    bsVC.delegate = bVC;
    UISplitViewController *split = [[UISplitViewController alloc]init];
    split.viewControllers=@[[bsVC wrappedInNavigation],[bVC wrappedInNavigation]];
    
    self.window.rootViewController = split;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) addDummyData{
    
    [self.stack zapAllData];
    
    BSITag *tag1 = [BSITag tagWithName:@"version Control"
                               context:self.stack.context];
    BSITag *tag2 = [BSITag tagWithName:@"git"
                               context:self.stack.context];
    NSSet *tags = [NSSet setWithObjects:tag1, tag2, nil];
    
    BSIAuthor *a1 = [BSIAuthor authorWithName:@"Scott Chacon"
                                      context:self.stack.context];
    BSIAuthor *a2 = [BSIAuthor authorWithName:@"Ben Straub"
                                      context:self.stack.context];
    NSSet *authors = [NSSet setWithObjects:a1, a2, nil];
    
    BSIBook *b1 = [BSIBook bookWithTitle:@"Pro Git"
                            frontPageURL:@"http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg"
                                  pdfURL:@"https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf"
                              isFavorite:NO
                                    tags:tags
                                 authors:authors
                                 context:self.stack.context];
    b1.frontPage.imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:b1.frontPageURL]];
    
    BSINote *n1 = [BSINote noteWithname:@"n1"
                                   text:@"texto de n1"
                                  image:[BSIPhoto insertInManagedObjectContext:self.stack.context]
                                   book:b1
                                context:self.stack.context];
    
    BSINote *n2 = [BSINote noteWithname:@"n2"
                                   text:@"texto de n2"
                                  image:[BSIPhoto insertInManagedObjectContext:self.stack.context]
                                   book:b1
                                context:self.stack.context];
    
    NSLog(@" %@ \n %@", n1, n2);
    
    //Prueba de búsqueda
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSINote entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:BSINoteAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"name = %@", n1.name];
    NSArray *results = [self.stack executeFetchRequest:req
                                            errorBlock:^(NSError *error) {
                                                NSLog(@"error al buscar %@", error);
                                            }];
    NSLog(@"%@", results);
    
    //Borrar
    //[self.stack.context deleteObject:n1];

    //Guardar
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);
    }];
}

-(void)configureFirstAppear{
    
    //Comprobamos si tenemos guardado el JSON
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![ud objectForKey:DOWNLOAD_FINISH]) {
        
        //nos vamos a segundo plano a descargar el json
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            
            NSURL *jsonURL = [NSURL URLWithString:@"https://keepcodigtest.blob.core.windows.net/containerblobstest/books_readable.json"];
            NSData *data = [NSData dataWithContentsOfURL:jsonURL];
            //cuando la tengo, me voy a primer plano
            dispatch_async(dispatch_get_main_queue(), ^{
                //introduzco en core data lo que me descargo
                [self.stack addDownloadedData:data];
            });
            
        });
    }
}
                            
-(BookViewController *) bookViewControllerWithLastBook{
    
    //compruebo si hay libro guardado
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:LAST_SELECTED_BOOK];
    if (ud) {
        //creo el controlador con el libro guardado
        return [[BookViewController alloc]initWithModel:[BSIBook objectWithArchivedURIRepresentation:data
                                                                                             context:self.stack.context]];
    //si no hay libro
    }else{
        //creo el controlador por defecto
        return [[BookViewController alloc] init];
    }
    
}

                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            

@end
