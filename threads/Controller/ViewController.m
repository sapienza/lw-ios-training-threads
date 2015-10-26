//
//  ViewController.m
//  threads
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import "ImageLoder.h"

@interface ViewController ()
   @property (nonatomic, weak)  IBOutlet UIImageView *imageView;
   @property (nonatomic,retain) IBOutlet UIActivityIndicatorView * activityView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)updateImgOnTap:(id)sender{
  //testing singleton implementation
  [ImageLoder load];

  [self.activityView startAnimating];

  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    NSLog(@"Img will be loaded in the background thread");
    
    NSURL *url = [NSURL URLWithString:@"http://go.nasa.gov/1NvITOM"];

    NSData *data = [[NSData alloc] initWithContentsOfURL:url];

    UIImage *tmpImage = [[UIImage alloc] initWithData:data];

    NSLog(@"Img loaded in the background thread");

    // After img be loaded in bg, we need to send the data to the main thead

    // Always when we need to update something related to interface, we need
    // to use the main queue/main thread. UI elements are there.
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.activityView stopAnimating];
      self.imageView.image = tmpImage;
    });
  });
}
@end
