import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData primaryTheme = ThemeData(
  primaryColor: const Color(0xFF1AC2DF),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.black87,
  ),
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.cairo(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 23.sp,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(backgroundColor: Colors.white70),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      iconColor: const Color(0xFF1AC2DF),
    ),
  ),
);
