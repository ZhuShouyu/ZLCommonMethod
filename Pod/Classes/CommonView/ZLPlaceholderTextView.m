//
//  ZLPlaceholderTextView.m
//  Pods
//
//  Created by ZhuShouyu on 7/17/15.
//
//

#import "ZLPlaceholderTextView.h"

@interface ZLPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;            //占位符

@end

@implementation ZLPlaceholderTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeTheSubviews];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initializeTheSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeTheSubviews];
    }
    return self;
}

/**
 *  初始化子界面
 */
- (void)initializeTheSubviews {
    _placeholderLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _placeholderLabel.font = self.font;
    _placeholderLabel.textColor = [UIColor grayColor];
    [self addSubview:_placeholderLabel];
    [_placeholderLabel sizeToFit];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChangeNotification:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  决定是否需要展示placeholder
 *
 *  @param notification 通知
 */
- (void)textViewTextDidChangeNotification:(NSNotification *)notification  {
    if ([notification.name isEqualToString:UITextViewTextDidChangeNotification]) {
        self.placeholderLabel.hidden = (self.text.length != 0);
    }
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    _attributedPlaceholder = attributedPlaceholder;
    self.placeholderLabel.attributedText = attributedPlaceholder;
}
@end
