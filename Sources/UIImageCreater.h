//
//  UIImageCreater.h
//  Wawaji
//
//  Created by yecongcong on 2018/3/7.
//  Copyright © 2018年 lotogram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageCreater : NSObject

+ (UIImage *)synthetizedShareImageWithDollImage:(UIImage *)dollImg
                                    qrCodeImage:(UIImage *)qrCodeImg
                                    headerImage:(UIImage *)headerImg
                                     inviteCode:(NSString *)inviteCode
                                      bonusText:(NSString *)bonusText;

@end
