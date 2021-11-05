//
//  QYWKWebView.h
//  QianZhi
//
//  Created by hanyazhao on 2021/10/16.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYWKWebView : WKWebView
@property (nonatomic, copy) void(^copyBlock)(NSString *content);
@property (nonatomic, copy) void(^shareBlock)(NSString *content);
@property (nonatomic, copy) void(^noteBlock)(NSString *content);
@property (nonatomic, copy) void(^collectionBlock)(NSString *content);
@end

NS_ASSUME_NONNULL_END
