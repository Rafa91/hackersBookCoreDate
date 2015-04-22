//
//  BSISimplePDFViewController.m
//  hackerBooks
//
//  Created by Rafael Navarro on 3/4/15.
//  Copyright (c) 2015 Beside. All rights reserved.
//

#import "BSISimplePDFViewController.h"
#import "BSIPdf.h"
#import "BSIBook.h"
#import "Settings.h"

@interface BSISimplePDFViewController ()

@property (nonatomic) BOOL canLoad;

@end

@implementation BSISimplePDFViewController

+(NSArray *) observableKeys{
    
    return @[@"model.pdfData"];
}

-(id) initWithModel: (BSIPdf *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        self.title = self.model.book.titleBook;
        _canLoad = YES;
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    // Asegurarse de que no se ocupa toda la pantalla
    // cuando estás en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupKVO];
    
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    // Asignar delegados
    self.webPDF.delegate = self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self tearDownKVO];
    
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{

    self.canLoad = NO;
    
}

-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    return self.canLoad;
    
}



#pragma mark - utils

-(void) syncWithModel{
    
    self.canLoad = YES;

    [self.webPDF loadData:self.model.pdfData
                 MIMEType:@"application/pdf"
         textEncodingName:@"UTF-8"
                  baseURL:[NSURL URLWithString:@"https://"]];
    
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

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    [self syncWithModel];
}

@end
