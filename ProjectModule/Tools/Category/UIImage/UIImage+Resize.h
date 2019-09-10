// UIImage+Resize.h
// Created by Trevor Harmon on 8/5/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support resizing/cropping

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

/*
 方法描述:
 修改UIImage大小
 
 参数说明:
 CGSize newSize 修改后的大小
 
 返回结果:
 UIImage* 返回修改大小后的UIImage
 */
- (UIImage*)resizeImageWithNewSize:(CGSize)newSize;

/*
 方法说明:
 通过color和size绘制UIImage
 
 参数说明:
 UIColor  color  UIImage的颜色
 CGSize   size   UIImage的大小
 
 返回结果:
 UIImage* 绘制的UIImage
 */
+ (UIImage*)imageFromColor:(UIColor*)color withSize:(CGSize)size;
@end
