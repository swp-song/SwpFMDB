
//
//  SelectModelsCell.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SelectModelsCell.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <POP/POP.h>
#import <Masonry/Masonry.h>
#import <SwpCateGory/UIFont+SwpFont.h>
#import <SwpCateGory/UIColor+SwpColor.h>
#import <SwpCateGory/SwpAttributedHeader.h>
/*! ---------------------- Tool       ---------------------- !*/

@interface SelectModelsCell ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 标题 view !*/
@property (nonatomic, strong) UILabel *titleView;
/*! 显示 副标题 view !*/
@property (nonatomic, strong) UILabel *subTitleView;
//@property (nonatomic, weak) UITableView *tableView;
/*! ---------------------- UI   Property  ---------------------- !*/

@end

@implementation SelectModelsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

/**!
 *  @author swp_song
 *
 *  @brief  initWithStyle:reuseIdentifier: ( Override Init )
 *
 *  @param  style           style
 *
 *  @param  reuseIdentifier reuseIdentifier
 *
 *  @return UITableViewCell
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        [self setUpUI];
        [self setUIAutoLayout];
    }
    return self;
}


/**!
 *  @author swp_song
 *
 *  @brief  setHighlighted:animated:    ( Override setHighlighted:animated )
 *
 *  @param  highlighted highlighted
 *
 *  @param  animated    animated
 */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 20.f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titleView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.titleView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}


/**!
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.contentView addSubview:self.titleView];
    [self.contentView addSubview:self.subTitleView];
}

/**!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView).mas_offset(UIEdgeInsetsMake(8, 10, 0, 10));
        make.height.equalTo(@(25));
    }];
    
    [self.subTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleView);
        make.bottom.equalTo(@(0));
        make.top.equalTo(self.titleView.mas_bottom);
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  setAttributedText:  ( 设置 AttributedString )
 *
 *  @param  text    text
 *
 *  @return NSAttributedString
 */
- (NSAttributedString *)setAttributedText:(NSString *)text  {
    NSArray *array = [text componentsSeparatedByString:@"-"];
    NSMutableAttributedString *type = [[NSMutableAttributedString alloc] initWithAttributedString:[self setAttributedString:array.firstObject setFont:[UIFont swpFontGillSansItalicFontSize:16.f] setTextFontColor:[UIColor swpColorWithHexadecimal:0x78D8F6]]];
    
    [type appendAttributedString:[self setAttributedString:array.lastObject setFont:[UIFont swpFontHelveticaNeueFontSize:16.f]  setTextFontColor:[UIColor swpColorWithHexadecimal:0x646464]]];
    return type.copy;
}

/**!
 *  @author swp_song
 *
 *  @brief  setData:indexPath:  ( 设置控件显示数据 )
 *
 *  @param  model       model
 *
 *  @param  indexPath   indexPath
 */
- (void)setData:(id)model indexPath:(NSIndexPath *)indexPath {
    self.titleView.attributedText = [self setAttributedText:[NSString stringWithFormat:@"%02ld.   -swpDBID = %@", indexPath.row + 1, [model valueForKey:@"swpDBID"]]];
    self.subTitleView.text        = [NSString stringWithFormat:@"%@ - 请单击查看更多数据", [model class]];
    self.backgroundColor = indexPath.row % 2 ? [[UIColor grayColor] colorWithAlphaComponent:0.1f] : [UIColor whiteColor];
}


/**!
 *  @author swp_song
 *
 *  @brief  setAttributedString:setFont:setTextFontColor:   ( 设置 attributedString )
 *
 *  @param  text        text
 *
 *  @param  font        font
 *
 *  @param  fontColor   fontColor
 *
 *  @return NSAttributedString
 */
- (NSAttributedString *)setAttributedString:(NSString *)text setFont:(UIFont *)font setTextFontColor:(UIColor *)fontColor {
    
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:text];
    
    SwpAttributedFont *swpAttributedFont       = [SwpAttributedFont new];
    swpAttributedFont.swpAttributedFont        = font;
    swpAttributedFont.swpAttributedEffectRange = NSMakeRange(0, richString.length);
    [richString addStringAttribute:swpAttributedFont];
    
    SwpAttributedColor *swpAttributedColor      = [SwpAttributedColor new];
    swpAttributedColor.swpAttributedColor       = fontColor;
    swpAttributedColor.swpAttributedEffectRange = NSMakeRange(0, richString.length);
    [richString addStringAttribute:swpAttributedColor];
    return richString.copy;
}

#pragma mark - Public Methods

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsCellInit  ( 快速初始化一个 Cell )
 */
+ (__kindof SelectModelsCell * _Nonnull (^)(UITableView * _Nonnull, NSString * _Nonnull))selectModelsCellInit {
    return ^(UITableView *tableView, NSString *identifier) {
        return [self.class selectModelsCellWithTableView:tableView forCellReuseIdentifier:identifier];
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsCellWithTableView:forCellReuseIdentifier:   ( 快速初始化一个 Cell )
 *
 *  @param  tableView   tableView
 *
 *  @param  identifier  identifier
 *
 *  @return UITableViewCell
 */
+ (instancetype)selectModelsCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier {
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

/**!
 *  @author swp_song
 *
 *  @brief  model   ( 设置数据 )
 */
- (SelectModelsCell * _Nonnull (^)(id _Nonnull, NSIndexPath * _Nonnull))model {
    return ^SelectModelsCell *(id model, NSIndexPath *indexPath) {
        if (!model) return self;
        [self setData:model indexPath:indexPath];
        return self;
    };
}

#pragma mark - Init UI Methods
- (UILabel *)titleView {
    return !_titleView ? _titleView = ({
        [UILabel new];
    }) : _titleView;
}

- (UILabel *)subTitleView {
    return !_subTitleView ? _subTitleView = ({
        UILabel *label  = [UILabel new];
        label.textColor = [UIColor swpColorWithHexadecimal:0x888888];
        label.font      = [UIFont swpFontAvenirLightWithFontSize:10.f];
        label;
    }) : _subTitleView;
}



@end
