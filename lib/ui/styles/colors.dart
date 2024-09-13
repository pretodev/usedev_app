part of './styles.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.mediumGray1 = const Color(0xFF444444),
    this.mediumGray2 = const Color(0xFFEFEFEF),
    this.darkBlue = const Color(0xFF090129),
    this.pink = const Color(0xFFFF55DF),
    this.green = const Color(0xFF8FFF24),
    this.darkPurple = const Color(0xFF430091),
    this.purple = const Color(0xFF780BF7),
  });

  // Medium Gray
  final Color mediumGray1;
  final Color mediumGray2;
  // Dark Blue
  final Color darkBlue;
  // Pink
  final Color pink;
  // Green
  final Color green;
  // Dark Purple
  final Color darkPurple;
  // Purple
  final Color purple;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? mediumGray1,
    Color? mediumGray2,
    Color? darkBlue,
    Color? pink,
    Color? green,
    Color? darkPurple,
    Color? purple,
  }) {
    return AppColors(
      mediumGray1: mediumGray1 ?? this.mediumGray1,
      mediumGray2: mediumGray2 ?? this.mediumGray2,
      darkBlue: darkBlue ?? this.darkBlue,
      pink: pink ?? this.pink,
      green: green ?? this.green,
      darkPurple: darkPurple ?? this.darkPurple,
      purple: purple ?? this.purple,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant AppColors? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return copyWith(
      mediumGray1: Color.lerp(mediumGray1, other.mediumGray1, t),
      mediumGray2: Color.lerp(mediumGray2, other.mediumGray2, t),
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t),
      pink: Color.lerp(pink, other.pink, t),
      green: Color.lerp(green, other.green, t),
      darkPurple: Color.lerp(darkPurple, other.darkPurple, t),
      purple: Color.lerp(purple, other.purple, t),
    );
  }
}
