import "package:ai_chatbot_colab/theme/colors/darkcolors.dart";
import "package:ai_chatbot_colab/theme/colors/lightcolors.dart";
import "package:ai_chatbot_colab/theme/styles.dart";
import "package:flutter/material.dart";

class AppThemes {
  AppThemes._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: LightColors.surface,
    textTheme: AppTextStyles.textTheme,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: LightColors.seedColor,
          brightness: Brightness.light,
        ).copyWith(
          // needes to be updated
          primary: LightColors.primary,
          onPrimary: LightColors.onPrimary,
          secondary: LightColors.secondary,
          onSecondary: LightColors.onSecondary,
          outline: LightColors.outline,
          outlineVariant: LightColors.outlineVariant,
          errorContainer: LightColors.errorContainer,
          onErrorContainer: LightColors.onErrorContainer,
          error: LightColors.error,
          onError: LightColors.onPrimary,
          surface: LightColors.surface,
          onSurface: LightColors.onSurface,
          surfaceContainerHighest: LightColors.surfaceContainerHighest,
          surfaceContainerLow: LightColors.surfaceContainerLow,
          surfaceContainerLowest: LightColors.surfaceContainerLowest,
          onSurfaceVariant: LightColors.onSurfaceVariant,
          tertiary: LightColors.tertiary,
          tertiaryContainer: LightColors.tertiaryContainer,
          onTertiaryContainer: LightColors.onTertiaryContainer,
          onTertiary: LightColors.onTertiary,
        ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: LightColors.outlineVariant.withAlpha(51),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: LightColors.primary.withAlpha(51),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: LightColors.error.withAlpha(51),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: LightColors.error.withAlpha(51),
        ),
      ),
      hintStyle: AppTextStyles.textTheme.bodyLarge!.copyWith(
        color: LightColors.outlineVariant.withAlpha(200),
      ),
      prefixIconColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return LightColors.primary.withAlpha(175);
        }
        return LightColors.outlineVariant.withAlpha(220);
      }),

      suffixIconColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return LightColors.primary.withAlpha(175);
        }
        return LightColors.outlineVariant.withAlpha(220);
      }),
      filled: true,
      fillColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return Color(0xffEAF4FF);
        }
        return LightColors.surfaceContainerLowest;
      }),
    ),

    // Buttons Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColors.primary,
        foregroundColor: LightColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
    // AppBar Theme
    appBarTheme: AppBarTheme(
      foregroundColor: LightColors.primary,
      backgroundColor: LightColors.surface.withAlpha(204),
      titleTextStyle: AppTextStyles.textTheme.titleLarge!.copyWith(
        color: LightColors.primary,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: LightColors.primary),
      elevation: 0,
    ),
  );

  // Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: DarkColors.surface,
    textTheme: AppTextStyles.textTheme,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: DarkColors.seedColor,
          brightness: Brightness.dark,
        ).copyWith(
          primary: DarkColors.primary,
          onPrimary: DarkColors.onPrimary,
          primaryContainer: DarkColors.primaryContainer,
          onPrimaryContainer: DarkColors.onPrimaryContainer,
          secondary: DarkColors.secondary,
          onSecondary: DarkColors.onSecondary,
          secondaryContainer: DarkColors.secondaryContainer,
          onSecondaryContainer: DarkColors.onSecondaryContainer,
          tertiary: DarkColors.tertiary,
          onTertiary: DarkColors.onTertiary,
          tertiaryContainer: DarkColors.tertiaryContainer,
          onTertiaryContainer: DarkColors.onTertiaryContainer,
          error: DarkColors.error,
          onError: DarkColors.onError,
          errorContainer: DarkColors.errorContainer,
          onErrorContainer: DarkColors.onErrorContainer,
          surface: DarkColors.surface,
          onSurface: DarkColors.onSurface,
          surfaceContainerHighest: DarkColors.surfaceVariant,
          onSurfaceVariant: DarkColors.onSurfaceVariant,
          outline: DarkColors.outline,
          outlineVariant: DarkColors.outlineVariant,
          shadow: Color(0xff000000),
          inverseSurface: DarkColors.inverseSurface,
          onInverseSurface: DarkColors.inverseOnSurface,
          inversePrimary: DarkColors.inversePrimary,
          surfaceTint: DarkColors.surfaceTint,
          surfaceContainerLow: DarkColors.surfaceContainerLow,
          surfaceContainerLowest: DarkColors.surfaceContainerLowest,
        ),
    // AppBar Theme
    appBarTheme: AppBarTheme(
      foregroundColor: DarkColors.primary,
      backgroundColor: DarkColors.surface.withAlpha(204),
      titleTextStyle: AppTextStyles.textTheme.titleLarge!.copyWith(
        color: DarkColors.primary,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: DarkColors.primary),
      elevation: 0,
    ),

    // Buttons Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColors.primary,
        foregroundColor: DarkColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: DarkColors.outlineVariant.withAlpha(51),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 1,
          color: DarkColors.primary.withAlpha(51),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(width: 1, color: DarkColors.error.withAlpha(51)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(width: 1, color: DarkColors.error.withAlpha(51)),
      ),
      hintStyle: AppTextStyles.textTheme.bodyLarge!.copyWith(
        color: DarkColors.primaryFixedDim.withAlpha(200),
      ),
      prefixIconColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return DarkColors.onPrimaryFixedVariant.withAlpha(200);
        }
        return DarkColors.primaryFixedDim.withAlpha(200);
      }),
      suffixIconColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return DarkColors.onPrimaryFixedVariant.withAlpha(200);
        }
        return DarkColors.primaryFixedDim.withAlpha(200);
      }),
      filled: true,
      fillColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.focused)) {
          return DarkColors.onPrimaryContainer;
          // Color(0xffEAF4FF);
        }
        return DarkColors.surfaceContainerLowest;
      }),
    ),
  );
}
