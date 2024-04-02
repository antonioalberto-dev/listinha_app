import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';
part 'custom_color.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  extensions: [lightCustomColors],
  textTheme: TextTheme(
    labelMedium: GoogleFonts.poppins(),
    titleMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.poppins(),
    labelLarge: GoogleFonts.poppins(fontSize: 12),
    bodyLarge: GoogleFonts.poppins(fontSize: 16),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: _lightColorScheme.primaryContainer,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _lightColorScheme.primary,
    foregroundColor: Colors.white,
  ),
  segmentedButtonTheme: _segmentedButtonTheme,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  extensions: [darkCustomColors],
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: _darkColorScheme.secondaryContainer,
  ),
);

SegmentedButtonThemeData get _segmentedButtonTheme => SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return GoogleFonts.poppins(fontSize: 13);
            }
            if (states.contains(MaterialState.selected)) {
              return GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              );
            }
            return GoogleFonts.poppins(fontSize: 12);
          },
        ),
      ),
    );
