//
//  TDMainViewController.h
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDMenuCellCollectionViewCell.h"
#import "TDDateMarkerView.h"
#import "AppDelegate.h"
#import "TDDateDetailParser.h"
#import "TDNoteDetailHolderView.h"

@interface TDMainViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@end
