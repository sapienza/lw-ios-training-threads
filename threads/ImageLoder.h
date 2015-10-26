//
//  ImageLoder.h
//  threads
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^startBlockType)(void);
typedef void(^completionBlockType)(NSData *imageData);

@interface ImageLoder : NSObject

+(instancetype)sharedInstance;

-(void)loadImageFromString:(NSString *)string
                     start:(startBlockType)startBlock
                completion:(completionBlockType)completion;

@end