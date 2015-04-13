//
//  AGTCoreDataStack+AGTCoreDataStack_DownloadedData.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 12/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "AGTCoreDataStack+AGTCoreDataStack_DownloadedData.h"
#import "BSIBook.h"
#import "Settings.h"

@implementation AGTCoreDataStack (AGTCoreDataStack_DownloadedData)

-(void) addDownloadedData: (NSData *)data{
    
    NSError *error;
    //Creo un array con los objetos JSON
    NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions
                                                             error:&error];
    
    //vuelvo a comporbar el vajor de JSONObjects para ver si hay error
    if (JSONObjects != nil) {
        for (NSDictionary *dic in JSONObjects) {
            BSIBook *aBook = [BSIBook bookWithDictionary:dic
                                                 context:self.context];
            [aBook setWithDictionary:dic];
            [aBook updateImage];
        }
        [self saveWithErrorBlock:^(NSError *error) {
            NSLog(@"Error al guardar %@", error.localizedDescription);
        }];
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:@YES
               forKey:DOWNLOAD_FINISH];
        [ud synchronize];
        
    }else{
        NSLog(@"error al pasear JSON: %@", error.localizedDescription);
    }
    
}



@end
