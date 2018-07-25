//
//  UIImageCreater.m
//  Wawaji
//
//  Created by yecongcong on 2018/3/7.
//  Copyright © 2018年 lotogram. All rights reserved.
//

#import "UIImageCreater.h"

@implementation UIImageCreater
+ (UIImage *)synthetizedShareImageWithDollImage:(UIImage *)dollImg
                                    qrCodeImage:(UIImage *)qrCodeImg
                                    headerImage:(UIImage *)headerImg
                                     inviteCode:(NSString *)inviteCode
                                     bonusText:(NSString *)bonusText
{
    CGFloat width = 750;
    CGFloat height = 1334;
    CGRect outRect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(outRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -height);
    CGContextClearRect(context, outRect);
    //背景图片
    UIImage *bgImg = [UIImage imageNamed:@"bg_combineshare.png"];
    CGContextDrawImage(context, outRect, bgImg.CGImage);
    if (qrCodeImg != nil)
    {
        //二维码
        CGContextDrawImage(context, CGRectMake(44, 44, 190, 190), qrCodeImg.CGImage);
    }
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1, -1);
    if (dollImg != nil)
    {
        //娃娃图片
        CGContextSaveGState(context);
        CGContextScaleCTM(context, 1, -1);
        CGContextTranslateCTM(context, 0, -height);
        CGRect dollImgFrame = CGRectMake((width - 400)/2,550,400,400);
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:dollImgFrame byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
        CGContextAddPath(context, cornerPath.CGPath);
        CGContextClip(context);
        CGContextDrawImage(context, dollImgFrame, dollImg.CGImage);
        CGContextTranslateCTM(context, 0, height);
        CGContextScaleCTM(context, 1, -1);
        CGContextRestoreGState(context);
    }
    if (headerImg != nil)
    {
        //用户头像
        CGContextSaveGState(context);
        CGContextScaleCTM(context, 1, -1);
        CGContextTranslateCTM(context, 0, -height);
        CGRect headerImgFrame = CGRectMake(162,295,100,100);
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:headerImgFrame byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(50, 50)];
        CGContextAddPath(context, cornerPath.CGPath);
        CGContextClip(context);
        CGContextDrawImage(context, headerImgFrame, headerImg.CGImage);
        CGContextTranslateCTM(context, 0, height);
        CGContextScaleCTM(context, 1, -1);
        CGContextRestoreGState(context);
    }
    if (inviteCode != nil)
    {
        //邀请码
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:48];
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        NSDictionary *attribute = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle,
                                   NSForegroundColorAttributeName:RGB_HEX(0xF149A8, 1)};
        CGSize size = [inviteCode boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        rect.origin.x = 384 - size.width/2.0f;
        rect.origin.y = 970;
        [inviteCode drawWithRect:rect options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    }
    if (bonusText != nil)
    {
        //邀请奖励文字
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:28];
        NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary*attribute = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle,
                                   NSForegroundColorAttributeName:[UIColor whiteColor]};
        CGSize size = [bonusText boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        rect.origin.x = 252;
        rect.origin.y = 1154;
        [bonusText drawWithRect:rect options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
