//
//  JECollectionViewHelper.h
//  KitDemo
//
//  Created by JIE on 2018/6/18.
//  Copyright © 2018年 AppleYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSInteger (^JECollectionSectionsBlock) (UICollectionView *collectionView);
typedef NSInteger (^JECollectionItemsInSectionBlock) (UICollectionView *collectionView, NSInteger section);
typedef UICollectionViewCell * (^JELoadCollectionViewCellBlock) (UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^JECollectionViewDidSelectBlock) (UICollectionView *collectionView, NSIndexPath *indexPath);


/**
 改helper只封装了最简单的代理和数据源。如果需要实现更复杂的代理,可以自己继承JECollectionViewHelper，并补充。
 */
@interface JECollectionViewHelper : NSObject <UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic)   UICollectionView    *collectionView;
@property (strong, nonatomic)   NSMutableArray      *collectionArray;


/**
 load collectionViewFlowLayout
 */
+ (UICollectionViewFlowLayout *)JELoadCollectionViewFlowLayoutWithItemSize:(CGSize)itemSize
                                                              sectionInset:(UIEdgeInsets)sectionInset
                                                          interitemSpacing:(CGFloat)interitemSpacing
                                                               lineSpacing:(CGFloat)lineSpacing
                                                                hasDefault:(BOOL)hasDefault;

/**
 初始化collectionView helper

 @param collectionView collectionView
 @param models 数据源
 @return helper
 */
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView dataModels:(NSMutableArray *)models;

/**
 helper 负责完成代理和数据。

 @param numberOfSectionsBlock section数量block
 @param numberOfItemsInSection item数量block
 @param loadCellBlock 加载cell的block
 @param didSelectBlock 点击事件block
 */
- (void)initNumberOfSection:(JECollectionSectionsBlock)numberOfSectionsBlock
     numberOfItemsInSection:(JECollectionItemsInSectionBlock)numberOfItemsInSection
     loadCollectionViewCell:(JELoadCollectionViewCellBlock)loadCellBlock
          addDidSelectBlock:(JECollectionViewDidSelectBlock)didSelectBlock;

/**
 如果reuseIdentifier和类名或xib名称不一样，别用以下两个方法。

 @param nibName xib名称
 */
- (void)registerNib:(NSString *)nibName;
- (void)registerClass:(NSString *)className;

@end

