//
//  StartPaymentController.h
//  PoundTest2
//
//  Created by GLENN DIXON on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StartPaymentController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *paymentSidField;
	IBOutlet UITextField *nameField;
}

- (void) servePayment;

@end
