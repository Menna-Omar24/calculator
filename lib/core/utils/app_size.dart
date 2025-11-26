import 'app_padding.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_height.dart';
import 'app_width.dart';

/// Application size constants (backward compatibility - delegates to specific classes)
class AppSize {
  // Padding (delegated to AppPadding)
  static const double paddingXS = AppPadding.xs;
  static const double paddingS = AppPadding.s;
  static const double paddingM = AppPadding.m;
  static const double paddingL = AppPadding.l;
  static const double paddingXL = AppPadding.xl;
  static const double paddingXXL = AppPadding.xxl;
  static const double buttonPadding = AppPadding.button;
  static const double displayPaddingH = AppPadding.displayH;
  static const double displayPaddingV = AppPadding.displayV;

  // Border Radius (delegated to AppRadius)
  static const double radiusS = AppRadius.s;
  static const double radiusM = AppRadius.m;
  static const double radiusL = AppRadius.l;
  static const double radiusXL = AppRadius.xl;
  static const double radiusXXL = AppRadius.xxl;
  static const double radiusCircular = AppRadius.circular;

  // Button Sizes
  static const double buttonHeight = AppHeight.button;
  static const double buttonMinWidth = AppWidth.buttonMin;

  // Icon Sizes (delegated to AppHeight)
  static const double iconXS = AppHeight.iconXS;
  static const double iconS = AppHeight.iconS;
  static const double iconM = AppHeight.iconM;
  static const double iconL = AppHeight.iconL;
  static const double iconXL = AppHeight.iconXL;
  static const double iconXXL = AppHeight.iconXXL;

  // Spacing (delegated to AppSpacing)
  static const double spacingXS = AppSpacing.xs;
  static const double spacingS = AppSpacing.s;
  static const double spacingM = AppSpacing.m;
  static const double spacingL = AppSpacing.l;
  static const double spacingXL = AppSpacing.xl;
  static const double spacingXXL = AppSpacing.xxl;
}

