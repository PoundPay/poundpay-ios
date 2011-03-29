//
//  ServePaymentController.h
//  PoundTest2
//
//  Created by GLENN DIXON on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PAYMENT_DONE_URL @"nothing://PAYMENT_DONE_URL"

@interface ServePaymentController : UIViewController <UIWebViewDelegate>{
	NSString *cardholderName;
	NSString *paymentSid;
	
	IBOutlet UIWebView *webView;
}

@property (retain, nonatomic) NSString *cardholderName;
@property (retain, nonatomic) NSString *paymentSid;

@end


// ripped from http://blog.ablepear.com/2008/12/urlencoding-category-for-nsdictionary.html
@interface NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString;

@end

static NSString *toString(id object) {
	return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
	NSString *string = toString(object);
	return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

@implementation NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString {
	NSMutableArray *parts = [NSMutableArray array];
	for (id key in self) {
		id value = [self objectForKey: key];
		NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
		[parts addObject: part];
	}
	return [parts componentsJoinedByString: @"&"];
}

@end
