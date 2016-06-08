//
//  RNVideoThumbnailManager.m
//  RNVideoThumbnailManager
//
//  Created by Chris LeBlanc on 4/4/16.
//  Copyright © 2016 Clever Lever. All rights reserved.
//

#import "RNVideoThumbnailManager.h"

@implementation RNVideoThumbnailManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();


// public api


RCT_EXPORT_METHOD(getThumbnail:(NSString *)url)
{
    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:self.url options:nil];
    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform=TRUE;
    [asset release];
    CMTime thumbTime = CMTimeMakeWithSeconds(0,30);
    
    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error){
        if (result != AVAssetImageGeneratorSucceeded) {
            NSLog(@"couldn't generate thumbnail, error:%@", error);
        }
        [button setImage:[UIImage imageWithCGImage:im] forState:UIControlStateNormal];
        thumbImg=[[UIImage imageWithCGImage:im] retain];
        [generator release];
    };
    
    CGSize maxSize = CGSizeMake(320, 180);
    generator.maximumSize = maxSize;
    [generator generateCGImagesAsynchronouslyForTimes:[NSArray arrayWithObject:[NSValue valueWithCMTime:thumbTime]] completionHandler:handler];
    
}

@end
