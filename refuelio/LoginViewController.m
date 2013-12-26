//
//  LoginViewController.m
//  refuelio
//
//  Created by Vicente Reig Rincon de Arellano on 12/25/13.
//  Copyright (c) 2013 Contrail Studio SL. All rights reserved.
//

#import "LoginViewController.h"
#import "User+Authenticate.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailInputField;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputField;
@property (weak, nonatomic) IBOutlet UIButton *performLoginButton;

@end

@implementation LoginViewController

- (void) viewDidLoad
{
    [self.emailInputField becomeFirstResponder];
}

- (BOOL) validateEmailField
{
    if (self.emailInputField.text.length < 1 ) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Iniciar sesión"
                              message: @"Introduce tu dirección de correo electrónico"
                              delegate: self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil ];
        [alert show];
        return NO;
    }
    return YES;
}

- (BOOL) validatePasswordField
{
    if (self.passwordInputField.text.length < 1 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Iniciar sesión"
                                                        message: @"Introduce tu contraseña"
                                                       delegate: self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil ];
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
        
        [User authenticateWithEmail: userName
                        AndPassword: password
             inManagedObjectContext: nil];
        
        
    }
}

- (IBAction)performLogin:(id)sender {
    [self validateAndSubmit];
}

@end
