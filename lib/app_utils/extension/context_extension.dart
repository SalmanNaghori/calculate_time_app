import 'package:flutter/material.dart';
import '../basic_import.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  double get height => mediaQuerySize.height;

  double get width => mediaQuerySize.width;

  bool get isPhone => (mediaQueryShortestSide < 600);

  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  bool get isTablet => isSmallTablet || isLargeTablet;
}

extension FontStyleExtension on BuildContext {
  TextStyle? get fontStyleExtraBold24 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontWeight: FontAsset.extraBold,
            fontSize: Dimensions.sp22,
            height: Dimensions.sp27 / Dimensions.sp22,
          );

  TextStyle? get fontStyleSemiBold10 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp8,
          );

  TextStyle? get fontStyleSemiBold12 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp10,
          );

  TextStyle? get fontStyleSemiBold13 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp11,
          );

  TextStyle? get fontStyleSemiBold14 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp12,
          );

  TextStyle? get fontStyleSemiBold14White => Theme.of(this)
      .textTheme
      .bodyLarge
      ?.copyWith(fontWeight: FontAsset.semiBold, fontSize: Dimensions.sp12);

  TextStyle? get fontStyleSemiBold16 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp14,
          );

  TextStyle? get fontStyleSemiBold17 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontSize: Dimensions.sp15,
            fontWeight: FontAsset.semiBold,
          );

  TextStyle? get fontStyleSemiBold15 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp13,
          );

  TextStyle? get fontStyleSemiBold20 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp18,
          );

  TextStyle? get fontStyleSemiBold22 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp20,
          );

  TextStyle? get fontStyleSemiBold30 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp28,
          );

  TextStyle? get fontStyleSemiBold22White =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp20,
          );

  TextStyle? get fontStyleSemiBold18 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.semiBold,
            fontSize: Dimensions.sp16,
          );

  TextStyle? get fontStyleRegular10 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp8,
          );

  TextStyle? get fontStyleRegular12 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp10,
          );

  TextStyle? get fontStyleRegular18 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp16,
          );

  TextStyle? get fontStyleRegular13 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp11,
          );

  TextStyle? get fontStyleRegular14 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp12,
          );

  TextStyle? get fontStyleRegular16 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp14,
          );

  TextStyle? get fontStyleRegular22 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp20,
          );

  TextStyle? get fontStyleRegular40 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp38,
          );

  TextStyle? get fontStyleRegular32 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp30,
          );

  TextStyle? get fontStyleRegular20 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.regular,
            fontSize: Dimensions.sp18,
          );

  TextStyle? get fontStyleMedium10 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp8,
          );

  TextStyle? get fontStyleMedium12 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp10,
          );

  TextStyle? get fontStyleMedium14 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp12,
          );

  TextStyle? get fontStyleMedium18 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp16,
          );
  TextStyle? get fontStyleMedium20 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
        fontWeight: FontAsset.medium,
        fontSize: Dimensions.sp18,
      );

  TextStyle? get fontStyleMedium14Red =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textRedColor,
          fontSize: Dimensions.sp12);

  TextStyle? get fontStyleMedium13 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp11,
          );

  TextStyle? get fontStyleMedium15 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp13,
          );

  TextStyle? get fontStyleMedium16 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp14,
          );

  TextStyle? get fontStyleMedium22 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp20,
          );

  TextStyle? get fontStyleMedium17 =>
      Theme.of(this).textTheme.headlineMedium?.copyWith(
            fontWeight: FontAsset.medium,
            fontSize: Dimensions.sp15,
          );

  TextStyle? get fontStyleMedium10Grey =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textGreyColor,
          fontSize: Dimensions.sp8);

  TextStyle? get fontStyleMedium12Grey =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textGreyColor,
          fontSize: Dimensions.sp10);

  TextStyle? get fontStyleMedium14Grey =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textGreyColor,
          fontSize: Dimensions.sp12);

  TextStyle? get fontStyleMedium14GreyAppbar =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textGreyColor2,
          fontSize: Dimensions.sp12);

  TextStyle? get fontStyleMedium16Grey =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textGreyColor,
          fontSize: Dimensions.sp14);

  TextStyle? get fontStyleMedium14Hint =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontWeight: FontAsset.medium,
          color: AppColor.textHintColor,
          fontSize: Dimensions.sp12);

  TextStyle? get fontStyleBold10 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp8,
          );

  TextStyle? get fontStyleBold12 =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp10,
          );

  TextStyle? get fontStyleBold14 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp12,
          );

  TextStyle? get fontStyleBold16 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp14,
          );

  TextStyle? get fontStyleBold18 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp16,
          );

  TextStyle? get fontStyleBold20 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp18,
          );

  TextStyle? get fontStyleBold22 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.bold,
            fontSize: Dimensions.sp20,
          );

  TextStyle? get fontStyleBlack40 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
            fontWeight: FontAsset.black,
            fontSize: Dimensions.sp30,
            height: 1,
          );

  TextStyle? get pButton => Theme.of(this).primaryTextTheme.labelLarge;

  Color? get containerColor => Theme.of(this).colorScheme.primaryContainer;
}

extension NavigatorExt on BuildContext {
  Future<T?> push<T>(Route<T> route) => Navigator.push(this, route);

  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed<T?>(this, routeName, arguments: arguments);

  bool canPop() => Navigator.canPop(this);

  void popUntil(RoutePredicate predicate) =>
      Navigator.popUntil(this, predicate);
}

extension ThemeExt on BuildContext {
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  bool get isMacOS => platform == TargetPlatform.macOS;

  bool get isWindows => platform == TargetPlatform.windows;

  bool get isFuchsia => platform == TargetPlatform.fuchsia;

  bool get isLinux => platform == TargetPlatform.linux;
}

extension ScaffoldExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackbar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackbar);

  void removeCurrentSnackBar(
          {SnackBarClosedReason reason = SnackBarClosedReason.remove}) =>
      ScaffoldMessenger.of(this).removeCurrentSnackBar(reason: reason);

  void hideCurrentSnackBar(
          {SnackBarClosedReason reason = SnackBarClosedReason.hide}) =>
      ScaffoldMessenger.of(this).hideCurrentSnackBar(reason: reason);

  void openDrawer() => Scaffold.of(this).openDrawer();

  void openEndDrawer() => Scaffold.of(this).openEndDrawer();

  void showBottomSheet(Widget Function(BuildContext) builder,
      {Color? backgroundColor,
      double? elevation,
      ShapeBorder? shape,
      Clip? clipBehaviour}) {
    showModalBottomSheet(
        context: this,
        builder: builder,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehaviour);
  }
}

class _Form {
  _Form(this._context);

  final BuildContext _context;

  bool validate() => Form.of(_context).validate();

  void reset() => Form.of(_context).reset();

  void save() => Form.of(_context).save();
}

extension FormExt on BuildContext {
  // ignore: library_private_types_in_public_api
  _Form get form => _Form(this);
}

class _FocusScope {
  const _FocusScope(this._context);

  final BuildContext _context;

  FocusScopeNode _node() => FocusScope.of(_context);

  bool get hasFocus => _node().hasFocus;

  bool get isFirstFocus => _node().isFirstFocus;

  bool get hasPrimaryFocus => _node().hasPrimaryFocus;

  bool get canRequestFocus => _node().canRequestFocus;

  void nextFocus() => _node().nextFocus();

  void requestFocus([FocusNode? node]) => _node().requestFocus(node);

  void previousFocus() => _node().previousFocus();

  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) =>
      _node().unfocus(disposition: disposition);

  void setFirstFocus(FocusScopeNode scope) => _node().setFirstFocus(scope);

  bool consumeKeyboardToken() => _node().consumeKeyboardToken();
}

extension FocusScopeExt on BuildContext {
  // ignore: library_private_types_in_public_api
  _FocusScope get focusScope => _FocusScope(this);

  void closeKeyboard() => focusScope.requestFocus(FocusNode());
}

extension ModalRouteExt<T> on BuildContext {
  ModalRoute<T>? get modalRoute => ModalRoute.of<T>(this);

  RouteSettings? get routeSettings => modalRoute?.settings;
}
