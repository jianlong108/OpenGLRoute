//
//  ViewController.m
//  OpenGL_Route
//
//  Created by JL on 2022/7/23.
//

#import "ViewController.h"
#import "OpenGLOneViewController.h"
#import "OpenGLTwoViewController.h"
#import "OpenGLMultitextureViewController.h"
#import "OpenGLTextureDynamicViewController.h"

#define cellid @"OPENGL--tableView"

@interface CellModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void(^clickAction)(void);

@end
@implementation CellModel
@end

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model =  self.dataSource[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = model.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model =  self.dataSource[indexPath.row];
    if (model.clickAction) {
        model.clickAction();
    }
}


- (NSArray *)dataSource
{
    if (!_dataSource) {
        CellModel *one = [CellModel new];
        one.name = @"1-基础绘制,三角形";
        one.clickAction = ^{
            OpenGLOneViewController *vc = [[OpenGLOneViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
        CellModel *two = [CellModel new];
        two.name = @"2-纹理绘图";
        two.clickAction = ^{
            OpenGLTwoViewController *vc = [[OpenGLTwoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
        CellModel *three = [CellModel new];
        three.name = @"3-多纹理绘图";
        three.clickAction = ^{
            OpenGLMultitextureViewController *vc = [[OpenGLMultitextureViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
        CellModel *four = [CellModel new];
        four.name = @"4-多纹理动态绘图";
        four.clickAction = ^{
            OpenGLTextureDynamicViewController *vc = [[OpenGLTextureDynamicViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
        _dataSource = @[one,two,three,four];
    }
    return _dataSource;
}


@end
