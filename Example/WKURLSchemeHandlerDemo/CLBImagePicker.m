//
//  CLBImagePicker.m
//  WKURLSchemeHandlerDemo_Example
//
//  Created by 陆明 on 2020/8/11.
//  Copyright © 2020 luming. All rights reserved.
//

#import "CLBImagePicker.h"
@interface CLBImagePicker()
@property (nonatomic, copy) void(^completionBlock)(BOOL flag, NSURLResponse *response, NSData *data);
@end
@implementation CLBImagePicker
- (void)clb_image:(void (^)(BOOL, NSURLResponse * _Nonnull, NSData * _Nonnull))block {

    UIViewController *viewController = UIApplication.sharedApplication.delegate.window.rootViewController;
       self.completionBlock = block;
       UIImagePickerController *picker = [[UIImagePickerController alloc] init];
       picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       picker.delegate = self;
       [viewController presentViewController:picker
                                    animated:YES
                                  completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES
                               completion:nil];

    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSData *data = UIImagePNGRepresentation(image);
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[NSURL URLWithString:@"custom-scheme-ybb://"]
                                                        MIMEType:@"image/png"
                                           expectedContentLength:data.length
                                                textEncodingName:NULL];
    if (self.completionBlock) {
        self.completionBlock(YES, response, data);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES
                               completion:nil];

    if (self.completionBlock) {
        self.completionBlock(NO, nil, nil);
    }
}

@end
