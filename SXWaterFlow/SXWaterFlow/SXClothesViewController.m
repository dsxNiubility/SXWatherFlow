//
//  SXClothesViewController.m
//  SXWaterFlow
//
//  Created by 董 尚先 on 15/3/21.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXClothesViewController.h"
#import "SXWaterflowLayout.h"
#import "SXModels.h"
#import "SXClothesCell.h"

@interface SXClothesViewController () <SXWaterflowLayoutDelegate>
@property (nonatomic, strong) NSMutableArray *allClothes;
@end

@implementation SXClothesViewController

- (NSMutableArray *)allClothes
{
    if (!_allClothes) {
        _allClothes = [[NSMutableArray alloc] init];
    }
    return _allClothes;
}

static NSString * const reuseIdentifier = @"clothes";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 切换布局
    SXWaterflowLayout *layout = [[SXWaterflowLayout alloc] init];
    layout.delegate = self;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    
    // 发送请求给服务器（加载数据，这里用的是plist假数据）
    NSArray *clothesArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clothes.plist" ofType:nil]];
                             
    [weakSelf.allClothes insertObjects:clothesArray atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, clothesArray.count)]];
    [weakSelf.collectionView reloadData];
    
}

#pragma mark - <SXWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(SXWaterflowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath withItemWidth:(CGFloat)width {
    SXModels *model = self.allClothes[indexPath.item];
    return model.h * width / model.w;
}

- (NSUInteger)columnsCountInWaterflowLayout:(SXWaterflowLayout *)layout
{
    return 4;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allClothes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SXClothesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.allClothes[indexPath.item];
    return cell;
}

@end
