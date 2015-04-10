#import "BSIPhoto.h"

@interface BSIPhoto ()

// Private interface goes here.

@end

@implementation BSIPhoto

-(void) setImage:(UIImage *)image{
    
    self.imageData = UIImageJPEGRepresentation(image, 0.9);
    
}

-(UIImage *) image{
    
    return [UIImage imageWithData:self.imageData];
    
}

@end
