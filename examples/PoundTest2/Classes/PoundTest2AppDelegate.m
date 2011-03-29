//
//  PoundTest2AppDelegate.m
//  PoundTest2
//
//  Created by GLENN DIXON on 2/25/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "PoundTest2AppDelegate.h"
#import "StartPaymentController.h"

@implementation PoundTest2AppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	StartPaymentController *startPaymentController = [[StartPaymentController alloc] init];
	navController = [[UINavigationController alloc] initWithRootViewController:startPaymentController];
	navController.navigationBar.tintColor = [UIColor darkGrayColor];
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
	[navController release];
    [window release];
    [super dealloc];
}


@end
