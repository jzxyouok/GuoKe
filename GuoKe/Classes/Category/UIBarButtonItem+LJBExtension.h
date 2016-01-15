//
//  UIBarButtonItem+LJBExtension.h
//  GuoKe
//
//  Created by CookieJ on 16/1/15.
//  Copyright © 2016年 ljunb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LJBExtension)

+ (UIBarButtonItem *)itemWithTarget:(id)target
                             Action:(SEL)action
                        normalImage:(NSString *)normalImage
                    hightlightImage:(NSString *)hightlightImage;

@end
