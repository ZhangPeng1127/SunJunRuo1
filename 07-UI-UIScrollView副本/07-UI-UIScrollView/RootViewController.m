//
//  RootViewController.m
//  07-UI-UIScrollView
//
//  Created by lanou3g on 15/5/28.
//  Copyright (c) 2015年 FBI. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate>
//设置属性 可能在其他方法里用到
@property(nonatomic,retain)UIScrollView *scrollView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.布局layoutScrolllView
    [self layoutScrollView];
    //2.布局UIImageView
    [self layoutUIImageView];
    
    
}
//2.布局UIImageView
-(void)layoutUIImageView
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375*2, 667*2)];
    imageView.image=[UIImage imageNamed:@"夕阳.jpg"];
    
    //设置tag值
    imageView.tag=100;
    [_scrollView addSubview:imageView];
    [imageView release];
}
//1.布局layoutScrollView
-(void)layoutScrollView
{
   //1.layoutScrollView 是UI中可以滑动的控件 它其实是UIView得子类,扩充了UIView滑动方面的功能 我们今后要学习的UITableView等滑动控件都是集成于它.
    //2.对于UIScollView 有两个核心的功能 滑动 和缩放
    //3.作为UI中的控件 本质上和 UILable UIBUtton 没有区别 在使用上仍然包括四步
    
    //1.创建对象
    self.scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    //2.配置属性
    self.scrollView.backgroundColor=[UIColor purpleColor];
    //滑动
    //(1)显示内容的大小
    self.scrollView.contentSize=CGSizeMake(375*2, 667*2);
    //(2)设置滚动条风格
    self.scrollView.indicatorStyle=UIScrollViewIndicatorStyleBlack;
    //(3)设置显示内容的偏移量
    //self.scrollView.contentOffset=CGPointMake(375, 667);
    //(4)点击状态栏 是否滑动到最顶端 默认是 YES.
    //self.scrollView.scrollsToTop=NO;
    //(5)设置整屏幕滑动
    self.scrollView.pagingEnabled=YES;
    //(6)设置边界是否可以回弹
    //self.scrollView.bounces=YES;
    //(7)是否能够可以滚动(滑动)
   // self.scrollView.scrollEnabled=NO;
    //(8)设置水平和竖直方向的滚动条
    self.scrollView.showsHorizontalScrollIndicator=YES;
    self.scrollView.showsVerticalScrollIndicator=NO;
    //(9)设置内容大小小于视图大小时 是否有反弹的效果
    self.scrollView.alwaysBounceHorizontal=YES;
    self.scrollView.alwaysBounceVertical=YES;
    //(10)设置代理
    self.scrollView.delegate=self;
    //3.添加父视图
    [self.view addSubview:_scrollView];
    //4.释放所有权
    [_scrollView release];
    
//缩放
    //(1)设置最大缩放比例 和最大缩放比例
    self.scrollView.maximumZoomScale=2;
    self.scrollView.minimumZoomScale=0.5;
    //(2)设置变化的比例
    self.scrollView.zoomScale=1.0;//默认是1
    //(3)设置缩放的反弹效果
    //self.scrollView.bouncesZoom=NO;
    
}
#pragma mark-UIScorllViewDelegate
//(10)滑动触发
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滑动了 %s %d",__FUNCTION__,__LINE__);
}
//开始拖拽
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"开始拖拽 %s %d",__FUNCTION__,__LINE__);
}
//结束拖拽
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"结束拖拽 %s %d",__FUNCTION__,__LINE__);
}
//开始减速
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"开始减速 %s %d",__FUNCTION__,__LINE__);
}
//已经结束减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束减速 %s %d",__FUNCTION__,__LINE__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-缩放代理
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //通过tag 获取 imageView
    UIImageView *imageView=(UIImageView *)[scrollView viewWithTag:100];
    return imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
