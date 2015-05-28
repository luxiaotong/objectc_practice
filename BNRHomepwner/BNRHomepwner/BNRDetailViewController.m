//
//  BNRDetailViewController.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/25.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRImageStore.h"
#import <UIKit/UIKit.h>

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *seriallNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BNRDetailViewController


#pragma mark - view
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ( self.bnrItem ) {
        self.navigationItem.title   = self.bnrItem.itemName;
        self.nameField.text         = self.bnrItem.itemName;
        self.seriallNumberField.text= self.bnrItem.serialNumber;
        self.valueField.text        = [NSString stringWithFormat:@"%d", self.bnrItem.valueInDollars];
        self.dateLabel.text         = [self.bnrItem.dateCreated description];
        self.imageView.image        = [[BNRImageStore sharedStore] getImageForKey:self.bnrItem.imageKey];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.bnrItem.itemName = self.nameField.text;
    self.bnrItem.serialNumber = self.seriallNumberField.text;
    self.bnrItem.valueInDollars = self.valueField.text.intValue;
}

#pragma mark - take picture
- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *imageKey = [uuid UUIDString];
    self.bnrItem.imageKey = imageKey;
    
    [[BNRImageStore sharedStore] setImage:image forKey:imageKey];
    self.imageView.image = image;
}

#pragma mark - text field delegate

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
