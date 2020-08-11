//
//  CLBViewController.m
//  WKURLSchemeHandlerDemo
//
//  Created by luming on 08/11/2020.
//  Copyright (c) 2020 luming. All rights reserved.
//

#import "CLBViewController.h"
#import <WebKit/WebKit.h>
#import "CLBURLSchemeHandler.h"
@interface CLBViewController ()

/**<#name#>*/
@property (nonatomic ,strong) WKWebView *webview;
@property (nonatomic ,strong) CLBURLSchemeHandler *urlSchemeHandler ;
@end

@implementation CLBViewController
- (IBAction)refresh:(id)sender {
    [_webview removeFromSuperview];
    _webview = nil;
    [self.view addSubview:self.webview];
     NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"customScheme" withExtension:@"htm"];
     NSURL *baseURL = [htmlURL URLByDeletingLastPathComponent];
     NSString *htmlString = [NSString stringWithContentsOfURL:htmlURL
     encoding:NSUTF8StringEncoding
     error:NULL];
     [self.webview loadHTMLString:htmlString baseURL:baseURL];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.webview];

    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"customScheme" withExtension:@"htm"];

     NSURL *baseURL = [htmlURL URLByDeletingLastPathComponent];
     NSString *htmlString = [NSString stringWithContentsOfURL:htmlURL
     encoding:NSUTF8StringEncoding
     error:NULL];
     [self.webview loadHTMLString:htmlString baseURL:baseURL];

}

- (WKWebView *)webview {

    if (!_webview) {

        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        if (@available(iOS 11.0, *)) {
            [configuration setURLSchemeHandler:self.urlSchemeHandler forURLScheme:@"custom-scheme-ybb"];
        } else {
            // Fallback on earlier versions
        }
        _webview = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:configuration];

    }
    return _webview;
}
- (CLBURLSchemeHandler *)urlSchemeHandler {
    if (!_urlSchemeHandler) {
        _urlSchemeHandler = [CLBURLSchemeHandler new];
    }
    return _urlSchemeHandler;
}

@end
