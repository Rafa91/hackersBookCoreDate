//
//  BSINoteViewController.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 20/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class BSINote;
@class BSIBook;
@interface BSINoteViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UITextField *nameView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(id) initWithModel: (BSINote *) model;

-(id) initForNewNoteInBook: (BSIBook *) book;

@end
