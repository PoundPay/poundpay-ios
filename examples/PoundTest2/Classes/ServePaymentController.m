//
//  ServePaymentController.m
//  PoundTest2
//
//  Created by GLENN DIXON on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ServePaymentController.h"


@implementation ServePaymentController

@synthesize paymentSid, cardholderName;

- (void)viewDidLoad {
	// Construct URL
	NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
						   paymentSid, @"payment_sid",			// required
						   PAYMENT_DONE_URL, @"redirect_uri",	// required
						   cardholderName, @"cardholder_name",	// optional
						   nil];
	NSString *path = @"http://www-sandbox.poundpay.com/pmp/mobile";
	NSString *url = [NSString stringWithFormat: @"%@?%@", path, [query urlEncodedString]];
	
	// Prepare UIWebView
	NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	webView.delegate = self;
	[webView loadRequest:req];

    [super viewDidLoad];
}

// We check every request to see if it is being redirect to PAYMENT_DONE_URL
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSString *url = request.URL.absoluteString;
	if ([url isEqualToString:PAYMENT_DONE_URL]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Payment Completed!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
		
		[self.navigationController popViewControllerAnimated:YES];
		return NO;
	} else if ([url isEqualToString:[NSString stringWithFormat:@"%@?error=1", PAYMENT_DONE_URL]]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"An error occurred" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
		
		[self.navigationController popViewControllerAnimated:YES];
		return NO;
	}
	return YES;
}

- (void)dealloc {
	[paymentSid release];
	[cardholderName release];
	
    [super dealloc];
}


@end
