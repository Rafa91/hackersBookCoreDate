//
//  BSIHackersBookBaseClass.m
//  hackersBookCoreDate
//
//  Created by Rafael Navarro on 10/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSIHackersBookBaseClass.h"

@implementation BSIHackersBookBaseClass

#pragma mark - Class Methods
+(NSArray *) observableKeys{
    
    return @[];
}

#pragma mark - life cycle
-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    
    //Solo se produce una vez en la vida del objeto
    [self setupKVO];
    
}

-(void) awakeFromFetch{
    
    [super awakeFromFetch];
    
    //se produce n veces en la vida del objeto
    [self setupKVO];
    
}

-(void) willTurnIntoFault{
    
    //se produce cuando el objeto se vacia convirtiendose en un fault
    [self tearDownKVO];
    
}


#pragma mark - KVO
-(void) setupKVO{
    
    //Observamos todas las propiedades excepto modificationDate
    for (NSString *key in [[self class] observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
    
}

-(void) tearDownKVO{
    
    //me doy de baja de todas las notificaciones
    for (NSString *key in [[self class] observableKeys]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
    
}


@end
