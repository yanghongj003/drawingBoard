//
//  drawBoardView.m
//  画板
//
//  Created by hsbc on 15/5/5.
//  Copyright (c) 2015年 hsbc. All rights reserved.
//

#import "drawBoardView.h"

@interface drawBoardView ()

@property (nonatomic,strong)NSMutableArray *pathArr;

@property (nonatomic,strong)UIColor *color;

@end

@implementation drawBoardView

- (NSMutableArray *)pathArr
{
    if (_pathArr == nil) {
        _pathArr = [NSMutableArray array];
    }
    return _pathArr;
}

- (void)drawRect:(CGRect)rect
{
    if (self.pathArr.count>0){
        for (int i = 0; i<self.pathArr.count; i++)
        {
            UIBezierPath *path = [self.pathArr objectAtIndex:i];
            
            path.lineWidth = 4;
            
            path.lineJoinStyle = kCGLineCapRound;
            
            [path stroke];
        }
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:point];
    
    [self.pathArr addObject:path];
    
    [self setNeedsDisplay];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [self.pathArr lastObject];
    
    [path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    UIBezierPath *path = [self.pathArr lastObject];
    
    [path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

- (void)clear {
    
    self.pathArr = nil;
    
    [self setNeedsDisplay];
}

- (void)back {
    
    [self.pathArr removeLastObject];
    
    [self setNeedsDisplay];

}

- (void)save{
    
    [self performSelectorInBackground:@selector(saveData) withObject:nil];
    
}
- (void)saveData
{
    UIGraphicsBeginImageContext(self.bounds.size);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ref];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);

}
- (void)setRed{
    
     self.color = [UIColor redColor];
    
}
- (void)setBlue{
    
    self.color = [UIColor blueColor];
}
#pragma mark -回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"------");

}
@end
