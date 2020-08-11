//
//  CLBImagePicker.h
//  WKURLSchemeHandlerDemo_Example
//
//  Created by 陆明 on 2020/8/11.
//  Copyright © 2020 luming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLBImagePicker : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (void)clb_image:(void(^)(BOOL flag, NSURLResponse *reponse, NSData *data))block;
@end

NS_ASSUME_NONNULL_END
