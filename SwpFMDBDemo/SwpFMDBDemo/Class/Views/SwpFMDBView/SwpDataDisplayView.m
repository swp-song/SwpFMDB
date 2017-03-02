//
//  SwpDataDisplayView.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpDataDisplayView.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <objc/message.h>
#import <SwpTools/SwpTools.h>
#import <SwpPopTools/SwpPopTools.h>
#import <SwpCateGory/UIFont+SwpFont.h>
#import <SwpCateGory/UIColor+SwpColor.h>
#import <SwpCateGory/SwpAttributedHeader.h>
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpDataDisplayView ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 数据 label !*/
@property (nonatomic, strong) UILabel  *dataDisplayView;
/*! ---------------------- UI   Property  ---------------------- !*/

@end

@implementation SwpDataDisplayView

// 0xD9C79D(金色) 0x74F87D(浅绿) 0x74D8F8 (浅蓝)

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame: ( Override Init )
 *
 *  @ param  frame
 *
 *  @ return SwpDataDisplayView
 */
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.dataDisplayView];
        self.dataDisplayView.frame  = CGRectMake(0, 0, frame.size.width - 30, frame.size.height - 30);
        self.dataDisplayView.center = self.center;
        self.backgroundColor        = [UIColor blackColor];
        [SwpTools swpToolSetTapGestureRecognizer:self setViewTag:1 setClickCount:1 setTarget:self setAction:@selector(clickEventView:) setCancelsTouchesInView:YES];
    }
    return self;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setData:   ( 设置 数据 )
 *
 *  @ param  model
 */
- (void)setData:(id)model {
    self.dataDisplayView.attributedText = [self mosaicModelAttributedString:model];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  clickEventView:    ( view 点击事件 )
 *
 *  @ param  tapGestureRecognizer
 */
- (void)clickEventView:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (self.swpDataDisplayViewClickEvent) self.swpDataDisplayViewClickEvent(self);
}


/**!
 *  @ author swp_song
 *
 *  @ brief  mosaicModelAttributedString:   ( 设置 模型 AttributedString )
 *
 *  @ param  model
 *
 *  @ return
 */
- (NSAttributedString *)mosaicModelAttributedString:(id)model  {

    __block NSArray *keys   = [NSArray array];
    __block NSArray *values = [NSArray array];
    [self getClassAll:model classKeysAndValues:^(NSArray *keys_, NSArray *values_) {
        keys   = keys_;
        values = values_;
    }];
    
    NSAttributedString        *text             = [self setTextAttributedString:[NSString stringWithFormat:@"\n %@,   属性名称 = 属性值 \n\n",  [model class]] setFont:[UIFont swpFontGillSansItalicFontSize:18.f] setTextFontColor:[UIColor swpColorWithHexadecimal:0x74F87D] setFirstLineHeadIndent:20 setParagraphSpacing:0 setParagraphSpacingBefore:0];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:text];
    
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *value = values[idx];
        NSAttributedString *text = [self setModelAttributedString:[NSString stringWithFormat:@"%ld. ", idx + 1] modelKey:key modelValeu:[NSString stringWithFormat:@" = %@\n", value]];
        [attributedString appendAttributedString:text];
    }];
 
    return attributedString.copy;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setModelAttributedString:modelKey:modelValeu:  ( 设置 设置 Model AttributedString )
 *
 *  @ param  indexKey
 *
 *  @ param  modelKey
 *
 *  @ param  modelValeu
 *
 *  @ return NSAttributedString
 */
- (NSAttributedString *)setModelAttributedString:(NSString *)indexKey modelKey:(NSString *)modelKey modelValeu:(NSString *)modelValeu {
    
    
    CGFloat firstLineHeadIndent = 0;
    
    if ([modelKey isEqualToString:@"dictionaryI"] || [modelKey isEqualToString:@"dictionaryM"]) {
        firstLineHeadIndent = 95;
    } else if ([modelKey isEqualToString:@"arrayI"] || [modelKey isEqualToString:@"arrayM"]) {
        firstLineHeadIndent = 70;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *index = [self setTextAttributedString:indexKey setFont:[UIFont swpFontGillSansItalicFontSize:14.f] setTextFontColor:[UIColor swpColorWithHexadecimal:0xD9C79D] setFirstLineHeadIndent:20 setParagraphSpacing:0 setParagraphSpacingBefore:5];
    
    NSAttributedString *key   = [self setTextAttributedString:modelKey setFont:[UIFont swpFontGillSansItalicFontSize:14.f] setTextFontColor:[UIColor swpColorWithHexadecimal:0x74D8F8] setFirstLineHeadIndent:0 setParagraphSpacing:0 setParagraphSpacingBefore:5];
    
    NSAttributedString *value = [self setTextAttributedString:modelValeu setFont:[UIFont swpFontGillSansItalicFontSize:12.f] setTextFontColor:[UIColor swpColorWithHexadecimal:0x74D8F8] setFirstLineHeadIndent:firstLineHeadIndent setParagraphSpacing:0 setParagraphSpacingBefore:5];
    
    [attributedString appendAttributedString:index];
    [attributedString appendAttributedString:key];
    [attributedString appendAttributedString:value];
    return attributedString.copy;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setTextAttributedString:setFont:setTextFontColor:setFirstLineHeadIndent:setParagraphSpacing:setParagraphSpacingBefore:     ( 设置 AttributedString )
 *
 *  @ param  text
 *
 *  @ param  font
 *
 *  @ param  fontColor
 *
 *  @ param  firstLineHeadIndent
 *
 *  @ param  paragraphSpacing
 *
 *  @ param  paragraphSpacingBefore
 *
 *  @ return NSAttributedString
 */
- (NSAttributedString *)setTextAttributedString:(NSString *)text setFont:(UIFont *)font setTextFontColor:(UIColor *)fontColor setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent setParagraphSpacing:(CGFloat)paragraphSpacing setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore {
    
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:text];

    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    style.firstLineHeadIndent       = firstLineHeadIndent;
    style.paragraphSpacingBefore    = paragraphSpacingBefore;   // 段落之前的间距
    style.paragraphSpacing          = paragraphSpacing;         // 段落后面的间距
    [richString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, richString.length)];
    
    {
        SwpAttributedFont *swpAttributedFont       = [SwpAttributedFont new];
        swpAttributedFont.swpAttributedFont        = font;
        swpAttributedFont.swpAttributedEffectRange = NSMakeRange(0, richString.length);
        [richString addStringAttribute:swpAttributedFont];
    }
    
    {
        SwpAttributedColor *swpAttributedColor      = [SwpAttributedColor new];
        swpAttributedColor.swpAttributedColor       = fontColor;
        swpAttributedColor.swpAttributedEffectRange = NSMakeRange(0, richString.length);
        [richString addStringAttribute:swpAttributedColor];
    }
    
    return richString.copy;
}


/**!
 *  @ author swp_song
 *
 *  @ brief getClassAll:classKeysAndValues: ( 取出 模型 数据 key And value )
 *
 *  @ param model
 *
 *  @ param class
 */
- (void)getClassAll:(id)model classKeysAndValues:(void(^)(NSArray *keys, NSArray *values))class {
    
    NSMutableArray *keys    = [NSMutableArray array];
    NSMutableArray *values  = [NSMutableArray array];
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList([model class], &outCount);
    for (int i = 0; i<outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if([[key substringToIndex:1] isEqualToString:@"_"]){
            key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        }
        [keys addObject:key];
        
        id value = [model valueForKey:key];
        
        if ([self verifySystemCollectionType:value]) {
            value = [self conversionJSONSting:value];
        }
        [values addObject:value];
    }
    
    free(ivars);
    
    if (class) class(keys, values);

}

/**!
 *  @ author swp_song
 *
 *  @ brief  conversionJSONSting:   ( 数组 | 字典 转换成 json 字符串 )
 *
 *  @ param  object
 *
 *  @ return NSString
 */
- (NSString *)conversionJSONSting:(id)object {
    NSData   *jsonData   = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  verifySystemCollectionType:    ( 验证 数据 是否是 系统 集合类型 )
 *
 *  @ param  value
 *
 *  @ return BOOL
 */
- (BOOL)verifySystemCollectionType:(id)value {
    if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
        return YES;
    }
    return NO;
}


#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataDisplayViewShow:    ( SwpDataDisplayView 显示 )
 */
- (SwpDataDisplayView *(^)())swpDataDisplayViewShow {
    
    return ^SwpDataDisplayView *() {
        self.alpha = 0.8;
        [SwpPopTools swpPopToolsView:self animated:NO];
        [SwpPopTools swpPopToolsView:self.dataDisplayView animated:YES];
        return self;
    };
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDataDisplayViewHidden:  ( swpDataDisplayViewHidden 隐藏 )
 */
- (SwpDataDisplayView *(^)())swpDataDisplayViewHidden {
    
    return ^SwpDataDisplayView *(){
        [UIView animateWithDuration:0.8 animations:^{
            self.alpha = 0;
        }];
        [SwpPopTools swpPopToolsViewCloseAnimated:YES];
        return self;
    };
}

/**!
 *  @ author swp_song
 *
 *  @ brief  model:  ( 设置 model  )
 */
- (SwpDataDisplayView *(^)(id model))model {
    return ^SwpDataDisplayView *(id model) {
        [self setData:model];
        return self;
    };
}


#pragma mark - Init UI Methods
- (UILabel *)dataDisplayView {
    return !_dataDisplayView ? _dataDisplayView = ({
        UILabel *label = [UILabel new];
        label.backgroundColor   = [UIColor clearColor];
        label.numberOfLines      = 0;
        label.layer.cornerRadius = 10;
        label.layer.borderWidth  = 1;
        label.layer.borderColor  = [UIColor whiteColor].CGColor;
        label;
    }) : _dataDisplayView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
