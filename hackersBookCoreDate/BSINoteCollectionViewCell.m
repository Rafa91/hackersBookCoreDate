//
//  BSINoteCollectionViewCell.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 19/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSINoteCollectionViewCell.h"
#import "BSINote.h"
#import "BSIPhoto.h"
@interface BSINoteCollectionViewCell()
@property (strong, nonatomic) BSINote* note;
@end

@implementation BSINoteCollectionViewCell

+(NSArray *)keys{
    
    return @[BSINoteAttributes.name, BSINoteAttributes.modificationDate, @"image.image"];
    
}

-(void) observeNote:(BSINote *) note{
    
    //Guarda en la propiedad
    self.note = note;
    //Observar ciertas propiedades
    for (NSString *key in [BSINoteCollectionViewCell keys]) {
        [self.note addObserver:self
                    forKeyPath:key
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }
    
    [self syncWithNote];
    
}

-(void) syncWithNote{
    
   
    self.titleNote.text = self.note.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
    
    
    UIImage *img;
    
    if (self.note.image.image == nil) {
        img = [UIImage imageNamed:@"noImage.png"];
    }else{
        img = self.note.image.image;
    }
    
    self.photoView.image = img;
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    [self syncWithNote];
    
}

-(void) prepareForReuse{
    
    self.note = nil;
    [self syncWithNote];
    
}

@end
