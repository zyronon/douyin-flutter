import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class MySliverAppBar extends StatefulWidget {
  /// Creates a Material Design app bar that can be placed in a [CustomScrollView].
  ///
  /// The arguments [forceElevated], [primary], [floating], [pinned], [snap]
  /// and [automaticallyImplyLeading] must not be null.
  const MySliverAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.backgroundColor,
    this.foregroundColor,
    @Deprecated(
      'This property is no longer used, please use systemOverlayStyle instead. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    @Deprecated(
      'This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    @Deprecated(
      'This property is obsolete and is false by default. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  })  : assert(automaticallyImplyLeading != null),
        assert(forceElevated != null),
        assert(primary != null),
        assert(floating != null),
        assert(pinned != null),
        assert(snap != null),
        assert(stretch != null),
        assert(toolbarHeight != null),
        assert(floating || !snap, 'The "snap" argument only makes sense for floating app bars.'),
        assert(stretchTriggerOffset > 0.0),
        assert(collapsedHeight == null || collapsedHeight >= toolbarHeight,
            'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].');

  /// {@macro flutter.material.appbar.leading}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? leading;

  final bool automaticallyImplyLeading;

  final Widget? title;

  final List<Widget>? actions;

  final Widget? flexibleSpace;

  final PreferredSizeWidget? bottom;

  final double? elevation;

  final double? scrolledUnderElevation;

  final Color? shadowColor;

  final Color? surfaceTintColor;

  final bool forceElevated;

  final Color? backgroundColor;

  final Color? foregroundColor;

  @Deprecated(
    'This property is no longer used, please use systemOverlayStyle instead. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final Brightness? brightness;

  final IconThemeData? iconTheme;

  final IconThemeData? actionsIconTheme;

  @Deprecated(
    'This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final TextTheme? textTheme;

  final bool primary;

  final bool? centerTitle;

  final bool excludeHeaderSemantics;

  final double? titleSpacing;

  final double? collapsedHeight;

  final double? expandedHeight;

  final bool floating;
  final bool pinned;

  final ShapeBorder? shape;

  final bool snap;

  final bool stretch;

  final double stretchTriggerOffset;

  final AsyncCallback? onStretchTrigger;

  final double toolbarHeight;

  final double? leadingWidth;

  @Deprecated(
    'This property is obsolete and is false by default. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final bool? backwardsCompatibility;

  final TextStyle? toolbarTextStyle;

  final TextStyle? titleTextStyle;

  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> with TickerProviderStateMixin {
  FloatingHeaderSnapConfiguration? _snapConfiguration;
  OverScrollHeaderStretchConfiguration? _stretchConfiguration;
  PersistentHeaderShowOnScreenConfiguration? _showOnScreenConfiguration;

  void _updateSnapConfiguration() {
    if (widget.snap && widget.floating) {
      _snapConfiguration = FloatingHeaderSnapConfiguration(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    } else {
      _snapConfiguration = null;
    }

    _showOnScreenConfiguration =
        widget.floating & widget.snap ? const PersistentHeaderShowOnScreenConfiguration(minShowOnScreenExtent: double.infinity) : null;
  }

  void _updateStretchConfiguration() {
    if (widget.stretch) {
      _stretchConfiguration = OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: widget.stretchTriggerOffset,
        onStretchTrigger: widget.onStretchTrigger,
      );
    } else {
      _stretchConfiguration = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _updateSnapConfiguration();
    _updateStretchConfiguration();
  }

  @override
  void didUpdateWidget(MySliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.snap != oldWidget.snap || widget.floating != oldWidget.floating) {
      _updateSnapConfiguration();
    }
    if (widget.stretch != oldWidget.stretch) {
      _updateStretchConfiguration();
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    final double bottomHeight = widget.bottom?.preferredSize.height ?? 0.0;
    final double topPadding = widget.primary ? MediaQuery.of(context).padding.top : 0.0;
    final double collapsedHeight = (widget.pinned && widget.floating && widget.bottom != null)
        ? (widget.collapsedHeight ?? 0.0) + bottomHeight + topPadding
        : (widget.collapsedHeight ?? widget.toolbarHeight) + bottomHeight + topPadding;

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SliverPersistentHeader(
        floating: widget.floating,
        pinned: widget.pinned,
        delegate: _SliverAppBarDelegate(
          vsync: this,
          leading: widget.leading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          title: widget.title,
          actions: widget.actions,
          flexibleSpace: widget.flexibleSpace,
          bottom: widget.bottom,
          elevation: widget.elevation,
          scrolledUnderElevation: widget.scrolledUnderElevation,
          shadowColor: widget.shadowColor,
          surfaceTintColor: widget.surfaceTintColor,
          forceElevated: widget.forceElevated,
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          brightness: widget.brightness,
          iconTheme: widget.iconTheme,
          actionsIconTheme: widget.actionsIconTheme,
          textTheme: widget.textTheme,
          primary: widget.primary,
          centerTitle: widget.centerTitle,
          excludeHeaderSemantics: widget.excludeHeaderSemantics,
          titleSpacing: widget.titleSpacing,
          expandedHeight: widget.expandedHeight,
          collapsedHeight: collapsedHeight,
          topPadding: topPadding,
          floating: widget.floating,
          pinned: widget.pinned,
          shape: widget.shape,
          snapConfiguration: _snapConfiguration,
          stretchConfiguration: _stretchConfiguration,
          showOnScreenConfiguration: _showOnScreenConfiguration,
          toolbarHeight: widget.toolbarHeight,
          leadingWidth: widget.leadingWidth,
          backwardsCompatibility: widget.backwardsCompatibility,
          toolbarTextStyle: widget.toolbarTextStyle,
          titleTextStyle: widget.titleTextStyle,
          systemOverlayStyle: widget.systemOverlayStyle,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.leading,
    required this.automaticallyImplyLeading,
    required this.title,
    required this.actions,
    required this.flexibleSpace,
    required this.bottom,
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.shadowColor,
    required this.surfaceTintColor,
    required this.forceElevated,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.brightness,
    required this.iconTheme,
    required this.actionsIconTheme,
    required this.textTheme,
    required this.primary,
    required this.centerTitle,
    required this.excludeHeaderSemantics,
    required this.titleSpacing,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.topPadding,
    required this.floating,
    required this.pinned,
    required this.vsync,
    required this.snapConfiguration,
    required this.stretchConfiguration,
    required this.showOnScreenConfiguration,
    required this.shape,
    required this.toolbarHeight,
    required this.leadingWidth,
    required this.backwardsCompatibility,
    required this.toolbarTextStyle,
    required this.titleTextStyle,
    required this.systemOverlayStyle,
  })  : assert(primary || topPadding == 0.0),
        assert(
          !floating || (snapConfiguration == null && showOnScreenConfiguration == null) || vsync != null,
          'vsync cannot be null when snapConfiguration or showOnScreenConfiguration is not null, and floating is true',
        ),
        _bottomHeight = bottom?.preferredSize.height ?? 0.0;

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool forceElevated;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextTheme? textTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double? expandedHeight;
  final double collapsedHeight;
  final double topPadding;
  final bool floating;
  final bool pinned;
  final ShapeBorder? shape;
  final double? toolbarHeight;
  final double? leadingWidth;
  final bool? backwardsCompatibility;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double _bottomHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max(topPadding + (expandedHeight ?? (toolbarHeight ?? kToolbarHeight) + _bottomHeight), minExtent);

  @override
  final TickerProvider vsync;

  @override
  final FloatingHeaderSnapConfiguration? snapConfiguration;

  @override
  final OverScrollHeaderStretchConfiguration? stretchConfiguration;

  @override
  final PersistentHeaderShowOnScreenConfiguration? showOnScreenConfiguration;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double visibleMainHeight = maxExtent - shrinkOffset - topPadding;
    final double extraToolbarHeight = math.max(minExtent - _bottomHeight - topPadding - (toolbarHeight ?? kToolbarHeight), 0.0);
    final double visibleToolbarHeight = visibleMainHeight - _bottomHeight - extraToolbarHeight;

    final bool isScrolledUnder = overlapsContent || forceElevated || (pinned && shrinkOffset > maxExtent - minExtent);
    final bool isPinnedWithOpacityFade = pinned && floating && bottom != null && extraToolbarHeight == 0.0;
    final double toolbarOpacity =
        !pinned || isPinnedWithOpacityFade ? clampDouble(visibleToolbarHeight / (toolbarHeight ?? kToolbarHeight), 0.0, 1.0) : 1.0;

    final Widget appBar = FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      toolbarOpacity: toolbarOpacity,
      isScrolledUnder: isScrolledUnder,
      child: AppBar(
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
        actions: actions,
        flexibleSpace: (title == null && flexibleSpace != null && !excludeHeaderSemantics)
            ? Semantics(
                header: true,
                child: flexibleSpace,
              )
            : flexibleSpace,
        bottom: bottom,
        elevation: isScrolledUnder ? elevation : 0.0,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        brightness: brightness,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        textTheme: textTheme,
        primary: primary,
        centerTitle: centerTitle,
        excludeHeaderSemantics: excludeHeaderSemantics,
        titleSpacing: titleSpacing,
        shape: shape,
        toolbarOpacity: toolbarOpacity,
        bottomOpacity: pinned ? 1.0 : clampDouble(visibleMainHeight / _bottomHeight, 0.0, 1.0),
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
        backwardsCompatibility: backwardsCompatibility,
        toolbarTextStyle: toolbarTextStyle,
        titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle,
      ),
    );
    return appBar;
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return leading != oldDelegate.leading ||
        automaticallyImplyLeading != oldDelegate.automaticallyImplyLeading ||
        title != oldDelegate.title ||
        actions != oldDelegate.actions ||
        flexibleSpace != oldDelegate.flexibleSpace ||
        bottom != oldDelegate.bottom ||
        _bottomHeight != oldDelegate._bottomHeight ||
        elevation != oldDelegate.elevation ||
        shadowColor != oldDelegate.shadowColor ||
        backgroundColor != oldDelegate.backgroundColor ||
        foregroundColor != oldDelegate.foregroundColor ||
        brightness != oldDelegate.brightness ||
        iconTheme != oldDelegate.iconTheme ||
        actionsIconTheme != oldDelegate.actionsIconTheme ||
        textTheme != oldDelegate.textTheme ||
        primary != oldDelegate.primary ||
        centerTitle != oldDelegate.centerTitle ||
        titleSpacing != oldDelegate.titleSpacing ||
        expandedHeight != oldDelegate.expandedHeight ||
        topPadding != oldDelegate.topPadding ||
        pinned != oldDelegate.pinned ||
        floating != oldDelegate.floating ||
        vsync != oldDelegate.vsync ||
        snapConfiguration != oldDelegate.snapConfiguration ||
        stretchConfiguration != oldDelegate.stretchConfiguration ||
        showOnScreenConfiguration != oldDelegate.showOnScreenConfiguration ||
        forceElevated != oldDelegate.forceElevated ||
        toolbarHeight != oldDelegate.toolbarHeight ||
        leadingWidth != oldDelegate.leadingWidth ||
        backwardsCompatibility != oldDelegate.backwardsCompatibility ||
        toolbarTextStyle != oldDelegate.toolbarTextStyle ||
        titleTextStyle != oldDelegate.titleTextStyle ||
        systemOverlayStyle != oldDelegate.systemOverlayStyle;
  }

  @override
  String toString() {
    return '${describeIdentity(this)}(topPadding: ${topPadding.toStringAsFixed(1)}, bottomHeight: ${_bottomHeight.toStringAsFixed(1)}, ...)';
  }
}
