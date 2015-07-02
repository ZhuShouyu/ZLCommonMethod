//
//  ZLRandomVerifyCodeView.m
//  Pods
//
//  Created by ZhuShouyu on 7/2/15.
//
//

#import "ZLRandomVerifyCodeView.h"

@interface ZLRandomVerifyCodeView ()

@property (nonatomic, strong) NSString *currentRandomCharacters;      //当前随机的数据源

@end

@implementation ZLRandomVerifyCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeTheDatasource];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initializeTheDatasource];
    }
    return self;
}

/**
 *  初始化数据源
 */
- (void)initializeTheDatasource {
    _charaterSource = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    _numberOfLines = 5;
    _numberOfCharactersToShow = 4;
}

/**
 *  刷新验证码
 */
- (void)resetRandomCharacters {
    [self setNeedsDisplay];
}

- (void)setNumberOfCharactersToShow:(NSUInteger)numberOfCharactersToShow {
    _numberOfCharactersToShow = numberOfCharactersToShow;
    [self setNeedsDisplay];
}

- (void)setNumberOfLines:(NSUInteger)numberOfLines {
    _numberOfLines = numberOfLines;
    [self setNeedsDisplay];
}

- (void)setCharaterSource:(NSArray *)charaterSource {
    if (charaterSource.count == 0) {
        @throw [NSException exceptionWithName:@"Error" reason:@"数据源个数不能为0" userInfo:nil];
    }
    _charaterSource = charaterSource;
    [self setNeedsDisplay];
}

/**
 *  更新当前需要展示的数据源
 */
- (void)updateRandomCharacters {
    NSString *tempString = @"";
    for (NSInteger index = 0; index < self.numberOfCharactersToShow; index ++) {
        NSInteger valueIndex = arc4random() % self.charaterSource.count;
        tempString = [tempString stringByAppendingString:self.charaterSource[valueIndex]];
    }
    self.currentRandomCharacters = tempString;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [self setBackgroundColor:color];
    
    NSString *text = [NSString stringWithFormat:@"%@",self.currentRandomCharacters];
    CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]}];
    int width = rect.size.width / text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    float pX, pY;
    for (int i = 0; i < text.length; i++)
    {
        pX = arc4random() % width + rect.size.width / text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]}];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(int cout = 0; cout < self.numberOfLines; cout++)
    {
        red = arc4random() % 100 / 100.0;
        green = arc4random() % 100 / 100.0;
        blue = arc4random() % 100 / 100.0;
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}
@end
