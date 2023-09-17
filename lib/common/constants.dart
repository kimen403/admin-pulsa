import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';
const BASE_URL = 'http://localhost:5000/server';

// colors
const primaryColor = Color.fromARGB(255, 97, 223, 255);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const Color kRichBlack = Color(0xFF000814);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color cIconWhite = Color(0xFFE5E5E5);
const Color kMikadoYellow = Color(0xFFffc300);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF303030);
const Color kGrey2 = Color(0xFF4B4B4B);
const Color kAppBase = Color(0xFF264653);
// text style
final TextStyle kHeading5 = GoogleFonts.poppins(
    fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white);
final TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Colors.white);
final TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headlineSmall: kHeading5,
  titleLarge: kHeading6,
  titleMedium: kSubtitle,
  bodyMedium: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: kMikadoYellow,
  secondary: secondaryColor,
  secondaryContainer: kPrussianBlue,
  surface: kRichBlack,
  background: bgColor,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
  onPrimaryContainer: Colors.black,
  onSecondaryContainer: Colors.black,
);

const defaultPadding = 16.0;
const defaultMargin = 16.0;
const defaultRadius = 8.0;
const defaultBorderWidth = 1.0;

const kDefaultPadding = EdgeInsets.all(defaultPadding);
const kDefaultMargin = EdgeInsets.all(defaultMargin);
const kDefaultRadius = BorderRadius.all(Radius.circular(defaultRadius));
const kDefaultBorder = Border.fromBorderSide(BorderSide(
  color: Colors.black,
  width: defaultBorderWidth,
));

const kDefaultShadowColor = Color(0xFFE6E6E6);

const kDefaultBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: kDefaultRadius,
  border: kDefaultBorder,
);

const kDefaultBoxShadow = BoxShadow(
  color: Colors.black12,
  blurRadius: 4,
  offset: Offset(0, 4),
);

const kDefaultBoxShadow2 = BoxShadow(
  color: Colors.black12,
  blurRadius: 4,
  offset: Offset(0, 2),
);

const kDefaultBoxShadow3 = BoxShadow(
  color: Colors.black12,
  blurRadius: 4,
  offset: Offset(0, 1),
);
