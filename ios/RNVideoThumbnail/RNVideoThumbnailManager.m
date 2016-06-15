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


RCT_EXPORT_METHOD(getThumbnail:(NSString *)path)
{
    NSURL *url = [NSURL fileURLWithPath:path];

    AVAsset *asset = [AVAsset assetWithURL:url];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    imageGenerator.appliesPreferredTrackTransform=TRUE;
    CMTime time = CMTimeMakeWithSeconds(0,30);
    
    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error){
        if (result != AVAssetImageGeneratorSucceeded) {
            NSLog(@"couldn't generate thumbnail, error:%@", error);
        }

        UIImage *thumbnail=[UIImage imageWithCGImage:im];
    };
    
    return thumbnail;
    
}

@end
