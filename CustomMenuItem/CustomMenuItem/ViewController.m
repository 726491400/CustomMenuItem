//
//  ViewController.m
//  CustomMenuItem
//
//  Created by hanyazhao on 2021/11/5.
//

#import "ViewController.h"
#import "QYWKWebView.h"

@interface ViewController ()
@property (nonatomic, strong) QYWKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"KIsShowQYMenuItem"];//缓存的开关bool值，项目中不需要自定义item的地方设为no即可
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self setMenuItem];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/"]]];
    // Do any additional setup after loading the view.
}
- (void)setMenuItem
{
    UIMenuController * menu = [UIMenuController sharedMenuController];
    UIMenuItem *item1 = [[UIMenuItem alloc]initWithTitle:@"写笔记" action:@selector(qy_addNotes:)];
    UIMenuItem *item2 = [[UIMenuItem alloc]initWithTitle:@"收藏" action:@selector(qy_collection:)];
    UIMenuItem *item3 = [[UIMenuItem alloc]initWithTitle:@"分享" action:@selector(qy_share:)];
    UIMenuItem *item4 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(qy_copy:)];
    [menu setMenuItems:@[item1,item2,item3,item4]];
    
    _webView.copyBlock = ^(NSString * _Nonnull content) {
        NSLog(@"复制操作、选中内容：%@",content);
    };
    
    _webView.shareBlock = ^(NSString * _Nonnull content) {
        NSLog(@"分享操作、选中内容：%@",content);
    };
    
    _webView.collectionBlock = ^(NSString * _Nonnull content) {
        NSLog(@"收藏操作、选中内容：%@",content);
    };
    
    _webView.noteBlock = ^(NSString * _Nonnull content) {
        NSLog(@"笔记操作、选中内容：%@",content);
    };
}
- (QYWKWebView *)webView
{
    if (!_webView) {
        _webView = [[QYWKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    }
    return _webView;
}

@end
