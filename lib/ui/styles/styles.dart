import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'text.dart';

@immutable
class AppStyle {
  final colors = const AppColors();

  final text = AppTextStyles.custom();

  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: colors.darkBlue),
        ),
        textTheme: TextTheme(
          displayLarge: text.displayLarge,
          displayMedium: text.displayMedium,
          displaySmall: text.displaySmall,
          headlineLarge: text.headlineLarge,
          headlineMedium: text.headlineMedium,
          headlineSmall: text.headlineSmall,
          titleLarge: text.titleLarge,
          titleMedium: text.titleMedium,
          titleSmall: text.titleSmall,
          bodyLarge: text.bodyLarge,
          bodyMedium: text.bodyMedium,
          bodySmall: text.bodySmall,
          labelLarge: text.labelLarge,
          labelMedium: text.labelMedium,
          labelSmall: text.labelSmall,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: colors.darkBlue, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: colors.pink, width: 2.0),
          ),
          hintStyle: text.bodySmall,
          labelStyle: text.labelSmall,
          helperStyle: text.labelTiny,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            backgroundColor: colors.purple,
            foregroundColor: Colors.white,
            textStyle: text.bodyLarge,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (states) => colors.darkPurple,
            ),
          ),
        ),
        extensions: [
          colors,
          text,
        ],
      );
}

extension ColorFilterOnColor on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}

extension AppStyleExtension on BuildContext {
  AppColors get appColors {
    return Theme.of(this).extension<AppColors>()!;
  }

  AppTextStyles get appTextStyles {
    return Theme.of(this).extension<AppTextStyles>()!;
  }
}
