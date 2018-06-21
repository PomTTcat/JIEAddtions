//
//  JECollectionViewHelper.m
//  KitDemo
//
//  Created by JIE on 2018/6/18.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import "JECollectionViewHelper.h"

@interface JECollectionViewHelper ()

@property (strong, nonatomic)   UICollectionView    *collectionView;
@property (strong, nonatomic)   NSMutableArray      *collectionArray; //这个属性用不到

//block
@property (copy, nonatomic)     JENumberOfSectionsBlock          sectionsBlock;
@property (copy, nonatomic)     JENumberOfItemsInSectionBlock    itemsInSectionBlock;
@property (copy, nonatomic)     JELoadCollectionViewCellBlock    loadCellBlock;
@property (copy, nonatomic)     JECollectionViewDidSelectBlock   didSelectBlock;

@end

@implementation JECollectionViewHelper

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView dataModels:(NSMutableArray *)models {
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = YES;
        
        _collectionArray = models;
    }
    return self;
}

- (void)initNumberOfSection:(JENumberOfSectionsBlock)numberOfSectionsBlock
     numberOfItemsInSection:(JENumberOfItemsInSectionBlock)numberOfItemsInSection
     loadCollectionViewCell:(JELoadCollectionViewCellBlock)loadCellBlock
          addDidSelectBlock:(JECollectionViewDidSelectBlock)didSelectBlock {

    self.sectionsBlock = numberOfSectionsBlock;
    self.itemsInSectionBlock = numberOfItemsInSection;
    self.loadCellBlock = loadCellBlock;
    self.didSelectBlock = didSelectBlock;
    
}

- (void)registerNib:(NSString *)nibName {
    [self.collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
}

- (void)registerClass:(NSString *)className {
    [self.collectionView registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (!self.sectionsBlock) {
        return 0;
    }
    
    return self.sectionsBlock(collectionView);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (!self.itemsInSectionBlock) {
        return 0;
    }
    
    return self.itemsInSectionBlock(collectionView,section);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.loadCellBlock) {
        return nil;
    }
    
    return self.loadCellBlock(collectionView, indexPath);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectBlock) {
        self.didSelectBlock(collectionView, indexPath);
    }
}

#pragma mark - load collectionViewFlowLayout
+ (UICollectionViewFlowLayout *)JELoadCollectionViewFlowLayoutWithItemSize:(CGSize)itemSize
                                                              sectionInset:(UIEdgeInsets)sectionInset
                                                          interitemSpacing:(CGFloat)interitemSpacing
                                                               lineSpacing:(CGFloat)lineSpacing
                                                                hasDefault:(BOOL)hasDefault {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    NSInteger margin = hasDefault?20:0;
    
    flowLayout.minimumInteritemSpacing = interitemSpacing?:margin;
    flowLayout.minimumLineSpacing = lineSpacing?:margin * 2;
    
    // 有默认itemsize
    if (CGSizeEqualToSize(itemSize, CGSizeZero) && hasDefault) {
        itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width / 2.5, 120);
    }
    flowLayout.itemSize = itemSize;
    
    // 有默认sectionInset
    if (UIEdgeInsetsEqualToEdgeInsets(sectionInset, UIEdgeInsetsZero) && hasDefault) {
        sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    }
    flowLayout.sectionInset = sectionInset;
    
    // default is Vertical too
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    return flowLayout;
}

@end
