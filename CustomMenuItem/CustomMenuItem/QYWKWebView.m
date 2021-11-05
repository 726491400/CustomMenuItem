//
//  QYWKWebView.m
//  QianZhi
//
//  Created by hanyazhao on 2021/10/16.
//

#import "QYWKWebView.h"

@implementation QYWKWebView

- (void)qy_copy:(UIMenuController *)menu
{
    [self evaluateJavaScript:@"window.getSelection().toString()" completionHandler:^(id _Nullable content, NSError * _Nullable error) {
        NSString *selectContent = (NSString *)content;
        NSLog(@"选中-----%@", selectContent);
        if (self.copyBlock) {
            self.copyBlock(selectContent);
        }
    }];
}

- (void)qy_share:(UIMenuController *)menu
{
    [self evaluateJavaScript:@"window.getSelection().toString()" completionHandler:^(id _Nullable content, NSError * _Nullable error) {
        NSString *selectContent = (NSString *)content;
        NSLog(@"选中-----%@", selectContent);
        if (self.shareBlock) {
            self.shareBlock(selectContent);
        }
    }];
}

- (void)qy_collection:(UIMenuController *)menu
{
    [self evaluateJavaScript:@"window.getSelection().toString()" completionHandler:^(id _Nullable content, NSError * _Nullable error) {
        NSString *selectContent = (NSString *)content;
        NSLog(@"选中-----%@", selectContent);
        if (self.collectionBlock) {
            self.collectionBlock(selectContent);
        }
    }];
}

- (void)qy_addNotes:(UIMenuController *)menu
{
    [self evaluateJavaScript:@"window.getSelection().toString()" completionHandler:^(id _Nullable content, NSError * _Nullable error) {
        NSString *selectContent = (NSString *)content;
        NSLog(@"选中-----%@", selectContent);
        if (self.noteBlock) {
            self.noteBlock(selectContent);
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
