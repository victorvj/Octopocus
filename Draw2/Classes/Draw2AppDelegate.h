//
//  Draw2AppDelegate.h
//  Draw2
//
//  Created by Hybrid Interaction on 21.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Draw2ViewController;

@interface Draw2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Draw2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Draw2ViewController *viewController;

@end

