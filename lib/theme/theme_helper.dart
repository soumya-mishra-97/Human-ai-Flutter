import 'package:human_ai/core/export.dart';

/// Helper class for managing themes and colors.
class ThemeManager {
  static String _themeData = 'primary';

  static void setThemeData(String theme) {
    _themeData = theme;
  }

  static String getThemeData() {
    return _themeData;
  }
}

class ThemeHelper {
  final _appTheme = ThemeManager.getThemeData();
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.red700,
            width: 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: GoogleFonts.manrope(
          fontSize: 20,
          color: const Color(0xff929292),
          fontWeight: FontWeight.w600,
        ),
        labelLarge: GoogleFonts.manrope(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.manrope(
          fontSize: 20,
          color: Colors.white54,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.manrope(
          fontSize: 15,
          color: Colors.white54,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: GoogleFonts.manrope(
          fontSize: 12,
          color: Colors.white60,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: GoogleFonts.manrope(
          fontSize: 15,
          color: const Color(0xff16AB51),
          fontWeight: FontWeight.w500,
        ),
        displayLarge: GoogleFonts.manrope(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.manrope(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.manrope(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray800 => const Color(0XFF3D4659);

  Color get blueGray900 => const Color(0XFF1E2534);

  Color get blue100 => const Color(0XFFD0DEF3);

  // Gray
  Color get gray800 => const Color(0XFF3F4E34);

  Color get gray900 => const Color(0XFF282A23);

  Color get gray9000 => const Color(0XFF252628);

  Color get gray90002 => const Color(0XFF101622);

  // Lime
  Color get lime500 => const Color(0XFFBCEB39);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  Color get whiteA54 => Colors.white54;

  // Yellow
  Color get yellow => const Color(0XFFFFF495);

  Color get yellow50 => const Color(0XFFFFFAE6);

  // Red
  Color get red700 => const Color(0XFFD32F2F);

  Color get blueGray => const Color(0X4CD9D9D9);

  Color get amber => const Color(0XFFFFE988);

  // Orange
  Color get orange200 => const Color(0XFFF4BA81);

  Color get orange300 => const Color(0XFFF0A559);

  Color get orange50 => const Color(0XFFFFF2E6);
}

class AppDecoration {
  static BoxDecoration get normalDecoration =>
      const BoxDecoration(color: Colors.transparent);

  static BoxDecoration get appBarDecoration => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    image: DecorationImage(
        image: AssetImage(AppImageConstant.logo),
        fit: BoxFit.cover),
  );

  static BoxDecoration get fillBottomNavContainer => BoxDecoration(
      color: appTheme.gray900,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)));

  static BoxDecoration get fillRecentRideContainer => const BoxDecoration(
      color: Color(0xff16AB51),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)));

  static BoxDecoration get dateDecoration => BoxDecoration(
      border: Border.all(color: Colors.white70, width: 2),
      borderRadius: BorderRadius.circular(8));

  static BoxDecoration get gradientBlueGray => BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        gradient: LinearGradient(
          begin: const Alignment(-0.23, 2.65),
          end: const Alignment(1.06, -0.3),
          colors: [
            appTheme.blueGray,
            appTheme.blueGray,
          ],
        ),
      );

  static BoxDecoration get gradientOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.92, 0),
          end: const Alignment(0.14, 1),
          colors: [
            appTheme.orange50,
            appTheme.orange200,
          ],
        ),
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray9000,
      );

  static BoxDecoration get gradientAmber => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1.01, 0.03),
          end: const Alignment(-0.05, 1),
          colors: [
            appTheme.amber,
            appTheme.blue100,
            appTheme.yellow50,
          ],
        ),
      );
}

class AppTextStyles {
  static final TextStyle hintRegularFonts14 = GoogleFonts.manrope(
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500
  );

  static final TextStyle regularFonts20 = GoogleFonts.manrope(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500
  );

  static TextStyle get displayLarge => GoogleFonts.manrope(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get displayMedium => GoogleFonts.manrope(
        fontSize: 18,
        color: const Color(0xff16AB51),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get displaySmall => GoogleFonts.manrope(
        fontSize: 14,
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get displaySmall1 => GoogleFonts.manrope(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get headlineLarge => GoogleFonts.manrope(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headlineMedium => GoogleFonts.manrope(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headlineLarge1 => GoogleFonts.manrope(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static get labelMedium => theme.textTheme.labelMedium?.copyWith(
      color: appTheme.whiteA700, fontWeight: FontWeight.w500, fontSize: 16);

  static get titleSmall => theme.textTheme.titleSmall?.copyWith(
        fontSize: 16,
        color: appTheme.orange300,
      );

  static TextStyle get headlineLarge2 => GoogleFonts.manrope(
        fontSize: 16,
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      );
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
