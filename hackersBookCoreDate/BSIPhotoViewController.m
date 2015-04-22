//
//  BSIPhotoViewController.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 21/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSIPhotoViewController.h"
#import "BSIPhoto.h"

@interface BSIPhotoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) BSIPhoto *model;
@end

@implementation BSIPhotoViewController

-(id) initWithModel:(BSIPhoto *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}

#pragma mark   - view lifecycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.photoView.image = self.model.image;
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.model.image = self.photoView.image;
    
}

- (IBAction)takePhoto:(id)sender {
    //Crear el imagePicker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    //asignar delegado
    picker.delegate = self;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:picker];
    //mostrarlo
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         
                     }];
}

- (IBAction)deletePhoto:(id)sender {
    //Guardar estado inicial
    CGRect oldBounds = self.photoView.bounds;
    
    [UIView animateWithDuration:0.6
                          delay:0
                        options:0
                     animations:^{
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_2_PI);
                     } completion:^(BOOL finished) {
                         self.photoView.image = nil;
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldBounds;
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
    
    self.model.image = nil;
    
}

#pragma mark - delgate
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *img =[info objectForKey:UIImagePickerControllerOriginalImage];
    self.model.image = img;
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
    
}


@end
