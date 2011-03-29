//
//  StartPaymentController.m
//  PoundTest2
//
//  Created by GLENN DIXON on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StartPaymentController.h"
#import "ServePaymentController.h"


@implementation StartPaymentController

- (void)viewDidLoad {
	self.title = @"Demo Payment";
	paymentSidField.delegate = self;
	paymentSidField.returnKeyType = UIReturnKeyDone;
	nameField.delegate = self;
	nameField.returnKeyType = UIReturnKeyDone;
	
    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	
	[self servePayment];
	
	return YES;
}

- (void) servePayment {
	ServePaymentController *servePaymentController = [[ServePaymentController alloc] init];
	servePaymentController.paymentSid = paymentSidField.text;
	servePaymentController.cardholderName = nameField.text;
	[self.navigationController pushViewController:servePaymentController animated:YES];
	[servePaymentController release];
}

- (void)dealloc {
    [super dealloc];
}


@end
