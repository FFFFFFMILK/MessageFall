# MessageFall
itcast 教程，简易微博布局：可变高度cell，frameModel 的使用

项目重点：
1. 自定义可变高度的 cell
2. 使用 frameModel，减少高度计算的次数，在获取数据的同时计算高度：直接写在 tableview 的高度获取代理方法里每一次 cell 出现都会调用一点，重复计算。

代码知识点：
1. 自定义 cell 的控件内容可以分为三步搭建完成：
   - 在获取数据之前，对所有不可变的内容进行布局，对可变的内容仅仅做实例化操作
    - 获取数据后，对内容进行赋值
   - 从 frameModel 中取出每个控件的 frame 值

2. 也就是说，所有关于高度的计算在 frameModel 中进行，数据获取之后，转化为 frameModel 进行存储。在 frameModel 中存储数据 Model。
3. 根据文本内容设置文本框的大小：

        // 名字
        CGSize nameLabelMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
        CGSize nameLabelRealSize = [messageModel.name boundingRectWithSize:nameLabelMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
        CGFloat nameLabelX = CGRectGetMaxX(_userImageViewFrame) + margin;
        CGFloat nameLabelY = (userImageWidth - nameLabelRealSize.height) /2 + margin;
    
        _nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelRealSize.width, nameLabelRealSize.height);

   - MaxSize：MAXFLOAT 代表的是浮点数的最大值，如此设置代表文本的宽度和高度都是可变的，文本框根据内容而变。
   - NSStringDrawingUsesLineFragmentOrigin：

	查看源码：

     typedef NS_OPTIONS(NSInteger, NSStringDrawingOptions) {
        NSStringDrawingUsesLineFragmentOrigin = 1 << 0, // The specified origin is the line fragment origin, not the base line origin
        NSStringDrawingUsesFontLeading = 1 << 1, // Uses the font leading for calculating line heights
        NSStringDrawingUsesDeviceMetrics = 1 << 3, // Uses image glyph bounds instead of typographic bounds
        NSStringDrawingTruncatesLastVisibleLine NS_ENUM_AVAILABLE(10_5, 6_0) = 1 << 5, // Truncates and adds the ellipsis character to the last visible line if the text doesn't fit into the bounds specified. Ignored if NSStringDrawingUsesLineFragmentOrigin is not also set.
    } NS_ENUM_AVAILABLE(10_0, 6_0);

    // NOTE: All of the following methods will default to drawing on a baseline, limiting drawing to a single line.
    // To correctly draw and size multi-line text, pass NSStringDrawingUsesLineFragmentOrigin in the options parameter.
    @interface NSString (NSExtendedStringDrawing)
    - (void)drawWithRect:(CGRect)rect options:(NSStringDrawingOptions)options attributes:(nullable NSDictionary<NSString *, id> *)attributes context:(nullable NSStringDrawingContext *)context NS_AVAILABLE(10_11, 7_0);
    - (CGRect)boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(nullable NSDictionary<NSString *, id> *)attributes context:(nullable NSStringDrawingContext *)context NS_AVAILABLE(10_11, 7_0);
    @end

	要理解 UsesLineFragmentOrigin，先看看上面两个方法之前的注释：
	>注意：所有方法默认绘制一条基准线，限制行数为一行；如果要正确的绘制多行文本，先使用 NSStringDrawingUsesLineFragmentOrigin 参数。

	从这里就可以看懂，这个参数注释所说的 not the base line origin 是哪个线哪个点了。

	也就是说，想要根据内容计算多行文本的 size，必须要带的就是这个参数。

4. CGRectGetMaxX：Return the rightmost x-value of `rect'：返回rect 的 x 坐标值，在用来在这种一个控件的 frame 计算另外一个 frame 的情况下比较好用，同样还有一个 CGRectGetMaxY。
