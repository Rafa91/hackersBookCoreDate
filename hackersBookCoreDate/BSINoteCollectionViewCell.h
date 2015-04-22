//
//  BSINoteCollectionViewCell.h
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 19/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSINote;

@interface BSINoteCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *titleNote;
@property (weak, nonatomic) IBOutlet UILabel *modificationDate;

-(void) observeNote:(BSINote *) note;

@end
