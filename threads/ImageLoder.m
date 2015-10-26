//
//  ImageLoder.m
//  threads
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ImageLoder.h"

@implementation ImageLoder
+(ImageLoder*)shareManager{
    
    static ImageLoder *sharedInstance=nil;
    static dispatch_once_t  oncePredecate;
    
    dispatch_once(&oncePredecate,^{
        sharedInstance=[[ImageLoder alloc] init];
        
    });
    return sharedInstance;
}

+(void)load{
  NSLog(@"test implementation");        
}
@end



