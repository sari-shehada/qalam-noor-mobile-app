import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts_helper.dart';

abstract class ThemesHelper {
  const ThemesHelper();

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontsHelper.fontFamily,
    scaffoldBackgroundColor: const Color(0xFFF5F6F8),
    useMaterial3: true,
    colorScheme: lightColorScheme,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      //#region Display
      displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 57.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
        height: 52 / 45,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 36.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      //#endregion

      //#region Headline
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      //#endregion

      //#region Title
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22.sp,
        color: lightColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.15.sp,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.1.sp,
      ),
      //#endregion

      //#region Label
      labelLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.1.sp,
      ),

      labelMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.5.sp,
      ),

      labelSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 11.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.5.sp,
      ),
      //#endregion

      //#region Body
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.15.sp,
      ),

      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.25.sp,
      ),

      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: lightColorScheme.onSurfaceVariant,
        letterSpacing: 0.4.sp,
      ),
      //#endregion
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: FontsHelper.fontFamily,
    scaffoldBackgroundColor: const Color(0xFF303030),
    splashColor: Colors.transparent,
    colorScheme: darkColorScheme,
    textTheme: TextTheme(
      //#region Display
      displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 57.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
        height: 52 / 45,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 36.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      //#endregion

      //#region Headline
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      //#endregion

      //#region Title
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22.sp,
        color: darkColorScheme.primary,
        letterSpacing: 0.sp,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.15.sp,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.1.sp,
      ),
      //#endregion

      //#region Label
      labelLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.1.sp,
      ),

      labelMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.5.sp,
      ),

      labelSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 11.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.5.sp,
      ),
      //#endregion

      //#region Body
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.15.sp,
      ),

      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.25.sp,
      ),

      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: darkColorScheme.onSurfaceVariant,
        letterSpacing: 0.4.sp,
      ),
      //#endregion
    ),
  );
}

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF265CB1),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E2FF),
  onPrimaryContainer: Color(0xFF001A41),
  secondary: Color(0xFF8D4F00),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDCC0),
  onSecondaryContainer: Color(0xFF2D1600),
  tertiary: Color(0xFF00687B),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFAFECFF),
  onTertiaryContainer: Color(0xFF001F27),
  error: Colors.red,
  // error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44474F),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303033),
  inversePrimary: Color(0xFFADC6FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF265CB1),
  outlineVariant: Color(0xFFC4C6D0),
  scrim: Color(0xFF000000),
);

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7F9ED9),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFF265CB1),
  secondary: Color(0xFFFFC266),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFF8D4F00),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF303033),
  onSurface: Color(0xFFFFFFFF),
  error: Colors.red,
  onError: Color(0xFFFFFFFF),

  //Older Colors
  onPrimaryContainer: Color(0xFFD8E2FF),
  onSecondaryContainer: Color(0xFFFFDCC0),
  tertiary: Color(0xFF56D6F6),
  onTertiary: Color(0xFF003641),
  tertiaryContainer: Color(0xFF004E5D),
  onTertiaryContainer: Color(0xFFAFECFF),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC4C6D0),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF265CB1),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFADC6FF),
  outlineVariant: Color(0xFF44474F),
  scrim: Color(0xFF000000),
);
