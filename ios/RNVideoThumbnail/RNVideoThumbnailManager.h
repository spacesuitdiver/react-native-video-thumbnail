//
//  RNVideoThumbnailManager.h
//  RNVideoThumbnailManager
//
//  Created by Chris LeBlanc on 4/4/16.
//  Copyright © 2016 Clever Lever. All rights reserved.
//

#import "RCTBridge.h"
#import <AVFoundation/AVFoundation.h>

@interface RNVideoThumbnailManager : NSObject <RCTBridgeModule>


@property (retain) UIImage *thumbnail;

@end
