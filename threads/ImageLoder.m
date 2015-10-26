//
//  ImageLoder.m
//  threads
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ImageLoder.h"

@implementation ImageLoder

+(instancetype)sharedInstance{
    
    static id instance =nil;
    
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken,^{
        instance=[[ImageLoder alloc] init];
        
    });
    return instance;
}

-(void)loadImageFromString:(NSString *)string
                     start:(startBlockType)startBlock
                completion:(completionBlockType)completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        startBlock();
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: string ]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(data);
        });
    });
}

@end



