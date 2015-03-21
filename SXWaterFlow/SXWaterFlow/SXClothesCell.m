//
//  SXClothesCell.m
//  SXWaterFlow
//
//  Created by 董 尚先 on 15/3/21.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXClothesCell.h"
#import "SXModels.h"

@interface SXClothesCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end

@implementation SXClothesCell

- (void)setModel:(SXModels *)model
{
    _model = model;
    self.priceLabel.text = model.price;
    
}

@end
