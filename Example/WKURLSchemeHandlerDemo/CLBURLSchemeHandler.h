//
//  CLBURLSchemeHandler.h
//  WKURLSchemeHandlerDemo_Example
//
//  Created by 陆明 on 2020/8/11.
//  Copyright © 2020 luming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
@class CLBImagePicker;
NS_ASSUME_NONNULL_BEGIN

@interface CLBURLSchemeHandler : NSObject <WKURLSchemeHandler>
@property (nonatomic ,strong) CLBImagePicker *imagePicker ;
@end

NS_ASSUME_NONNULL_END
