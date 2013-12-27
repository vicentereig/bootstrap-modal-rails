//
//  LoginViewController.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "LoginViewController.h"
#import "User+Authenticate.h"
#import "DocumentHandler.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailInputField;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputField;
@property (weak, nonatomic) IBOutlet UIButton *performLoginButton;
@property (strong, nonatomic) UIManagedDocument *document;
@end

@implementation LoginViewController

@synthesize document = _document;

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"login view will appear");
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (!self.document) {
        [[DocumentHandler sharedDocumentHandler] perform:^(UIManagedDocument *document){
            self.document = document;
            NSManagedObjectContext *context = self.document.managedObjectContext;
            //check if user's logged in
        }];
    }
}

- (void) viewDidLoad
{
    [self.emailInputField becomeFirstResponder];

}


- (BOOL) validateEmailField
{
    if (self.emailInputField.text.length < 1 ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Iniciar sesión"
                                                        message: @"Introduce tu dirección de correo electrónico"
                                                       delegate: self
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil ];
        [alert show];
        return NO;
    }
    return YES;
}

- (BOOL) validatePasswordField
{
    if (self.passwordInputField.text.length < 1 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Iniciar sesión"
                                                        message: @"Introduce tu contraseña"
                                                       delegate: self
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil ];
        [alert show];
        return NO;
    }
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    if ( textField == self.emailInputField ) {
        if (![self validateEmailField]) {
            return NO;
        }
    }
    
    
    if ( textField == self.passwordInputField ) {
        if (![self validatePasswordField]) {
//            return NO;
        }
 
    }
    
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder]; // stop using the keyboard
    
    if (textField == self.emailInputField) {
        [self.passwordInputField becomeFirstResponder];
    }
    
    if (textField == self.passwordInputField) {
        [self validateAndSubmit];
    }
    
    return YES;
}

- (void) validateAndSubmit
{
    if ( [self validateEmailField] && [self validatePasswordField] )
    {
        NSString *userName = [self.emailInputField text];
        NSString *password = [self.passwordInputField text];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Iniciar sesión"
//                                                        message: @"Introduce tu contraseña"
//                                                       delegate: self
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil ];
//        [alert show];
        if (!self.document) {
            [[DocumentHandler sharedDocumentHandler] perform:^(UIManagedDocument *document){
                self.document = document;
                NSManagedObjectContext *context = self.document.managedObjectContext;
                [User authenticateWithEmail: userName
                                AndPassword: password
                     inManagedObjectContext: context
                                  succeeded:^(User *authenticatedUser) {
                                      NSLog(@"User: %@ <%@>", authenticatedUser.email, authenticatedUser.authToken);
                                  } failed:^(NSError *error) {
                                      NSLog(@"Errorrr: %@", error);
                                  }];

            }];
        }
        
        
    }
}

- (IBAction)performLogin:(id)sender {
    [self validateAndSubmit];
}

@end
