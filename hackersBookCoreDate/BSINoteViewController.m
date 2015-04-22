//
//  BSINoteViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 20/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSINoteViewController.h"
#import "BSINote.h"
#import "BSIPhoto.h"
#import "BSIBook.h"
#import "BSIPhotoViewController.h"

@interface BSINoteViewController () <UITextFieldDelegate>

@property (nonatomic, strong) BSINote *model;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deleteCurrentNote;

@end

@implementation BSINoteViewController

#pragma mark - init
-(id) initWithModel: (BSINote *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    
    return self;
}

-(id) initForNewNoteInBook: (BSIBook *) book{
    
    BSINote *newNote = [BSINote noteWithname:@""
                                        text:@""
                                       image:[BSIPhoto insertInManagedObjectContext:book.managedObjectContext]
                                        book:book
                                     context:book.managedObjectContext];
    _new = YES;
    return [self initWithModel:newNote];
    
}

#pragma mark - View LifeCycle

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterLongStyle;
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.nameView.text = self.model.name;
    self.textView.text = self.model.text;
    
    UIImage *img = self.model.image.image;
    if (!img) {
        img = [UIImage imageNamed:@"noImage.png"];
    }
    self.photoView.image = img;
    [self startObservingKeyboard];
    [self setupAccessoryInputView];
    if (self.new) {
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                               target:self
                                                                               action:@selector(cancel:)];
        self.navigationItem.rightBarButtonItem = cancel;
    }
    self.nameView.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(displayDetailPhoto:)];
    [self.photoView addGestureRecognizer:tap];
}

-(void) viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    if (self.deleteCurrentNote) {
        [self.model.managedObjectContext deleteObject:self.model];
    }else{
        self.model.text = self.textView.text;
        self.model.image.image = self.photoView.image;
        self.model.name = self.nameView.text;
    }
    [self stopObservingKeyboard];
    
}

#pragma mark - keyboard

-(void) startObservingKeyboard{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDissappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
}

-(void) stopObservingKeyboard{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
    
}

-(void) notifyThatKeyboardWillAppear: (NSNotification *) notification{
    
    if ([self.textView isFirstResponder]) {
        //extraer user info
        NSDictionary *dict = notification.userInfo;
        //extraer la duración de la animación
        double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey ]doubleValue];
        // cambiar las propiedades de la caja de texteo
        [UIView animateWithDuration:duration
                              delay:0
                            options:0
                         animations:^{
                             
                             self.textView.frame = CGRectMake(self.modificationDateView.frame.origin.x, self.modificationDateView.frame.origin.y, self.textView.frame.size.width, self.textView.frame.size.height);
                             
                             
                         } completion:nil];
        [UIView animateWithDuration:duration
                         animations:^{
                             self.textView.alpha = 0.8;
                         } completion:nil];
    }

}

-(void) notifyThatKeyboardWillDissappear: (NSNotification *) notification{
    
    if ([self.textView isFirstResponder]) {
        //extraer user info
        NSDictionary *dict = notification.userInfo;
        //extraer la duración de la animación
        double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey ]doubleValue];
        // cambiar las propiedades de la caja de texteo
        [UIView animateWithDuration:duration
                              delay:0
                            options:0
                         animations:^{
                             
                             self.textView.frame = CGRectMake(0, 527, self.textView.frame.size.width, self.textView.frame.size.height);
                             
                             
                         } completion:nil];
        [UIView animateWithDuration:duration
                         animations:^{
                             self.textView.alpha = 1;
                         } completion:nil];
    }
}


-(void) setupAccessoryInputView{
    
    //creamos una barra
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //añadimos botones
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                          target:self
                                                                          action:@selector(dismissKeyboard:)];
    UIBarButtonItem *sep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil];
    [bar setItems:@[sep, done]];
    //la asignamos como accessoryInputView
    self.textView.inputAccessoryView = bar;
    self.nameView.inputAccessoryView = bar;
    
}

-(void) dismissKeyboard: (id)sender{
    
    [self.view endEditing:YES];
    
}

#pragma mark - delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    //podríamos validar el texto
    [textField resignFirstResponder];
    return YES;
    
}

#pragma mark - actions

-(void) cancel:(id) sender{
    
    self.deleteCurrentNote = YES;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) displayDetailPhoto:(id) sender {

    [self.navigationController pushViewController:[[BSIPhotoViewController alloc] initWithModel:self.model.image]
                                         animated:YES];
    
}


@end
