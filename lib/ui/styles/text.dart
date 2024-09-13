part of 'styles.dart';

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  factory AppTextStyles.custom() => AppTextStyles(
        displayLarge: GoogleFonts.orbitron(
          fontSize: 76,
          height: 76 / 76,
        ),
        displayMedium: GoogleFonts.orbitron(
          fontSize: 61,
          height: 73.2 / 61,
        ),
        displaySmall: GoogleFonts.orbitron(
          fontSize: 48,
          height: 57.6 / 48,
        ),
        // Headline styles
        headlineLarge: GoogleFonts.orbitron(
          fontSize: 39,
          height: 46.8 / 39,
        ),
        headlineMedium: GoogleFonts.orbitron(
          fontSize: 31,
          height: 37.2 / 31,
        ),
        headlineSmall: GoogleFonts.orbitron(
          fontSize: 25,
          height: 25 / 25,
        ),
        // Title styles
        titleLarge: GoogleFonts.orbitron(
          fontSize: 16,
          height: 19.2 / 16,
        ),
        // Heading styles
        titleMedium: GoogleFonts.poppins(
          fontSize: 39,
          fontWeight: FontWeight.w400, // Regular weight
          height: 46.8 / 39,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 31,
          fontWeight: FontWeight.w600, // SemiBold weight
          height: 46.5 / 31,
        ),
        headlineSmallPoppins: GoogleFonts.poppins(
          fontSize: 31,
          fontWeight: FontWeight.w400, // Regular weight
          height: 46.5 / 31,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w400, // Regular weight
          height: 30 / 25,
        ),
        // Body styles
        bodyLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w700, // Bold weight
          height: 24 / 20,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400, // Regular weight
          height: 24 / 20,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400, // Regular weight
          height: 19.2 / 16,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600, // SemiBold weight
          height: 19.2 / 16,
        ),
        // Label styles
        labelSmall: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w400, // Regular weight
          height: 15.6 / 13,
        ),
        labelSmallBold: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w700, // Bold weight
          height: 15.6 / 13,
        ),
        labelTiny: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400, // Regular weight
          height: 12 / 10,
        ),
      );

  const AppTextStyles({
    this.displayLarge = const TextStyle(),
    this.displayMedium = const TextStyle(),
    this.displaySmall = const TextStyle(),
    this.headlineLarge = const TextStyle(),
    this.headlineMedium = const TextStyle(),
    this.headlineSmall = const TextStyle(),
    this.headlineSmallPoppins = const TextStyle(),
    this.titleLarge = const TextStyle(),
    this.titleMedium = const TextStyle(),
    this.titleSmall = const TextStyle(),
    this.bodyLarge = const TextStyle(),
    this.bodyMedium = const TextStyle(),
    this.bodySmall = const TextStyle(),
    this.labelLarge = const TextStyle(),
    this.labelMedium = const TextStyle(),
    this.labelSmall = const TextStyle(),
    this.labelSmallBold = const TextStyle(),
    this.labelTiny = const TextStyle(),
  });

  // Define Text Styles
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle headlineSmallPoppins;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle labelSmallBold;
  final TextStyle labelTiny;

  @override
  AppTextStyles copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? headlineSmallPoppins,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? labelSmallBold,
    TextStyle? labelTiny,
  }) {
    return AppTextStyles(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      headlineSmallPoppins: headlineSmallPoppins ?? this.headlineSmallPoppins,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      labelSmallBold: labelSmallBold ?? this.labelSmallBold,
      labelTiny: labelTiny ?? this.labelTiny,
    );
  }

  @override
  AppTextStyles lerp(covariant AppTextStyles? other, double t) {
    if (other == null) return this;
    return AppTextStyles(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      headlineSmallPoppins:
          TextStyle.lerp(headlineSmallPoppins, other.headlineSmallPoppins, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      labelSmallBold: TextStyle.lerp(labelSmallBold, other.labelSmallBold, t)!,
      labelTiny: TextStyle.lerp(labelTiny, other.labelTiny, t)!,
    );
  }
}
