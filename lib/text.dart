import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      this.lines});
  final String text;
  final Color color;
  final double size;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: lines,
      overflow: TextOverflow.fade,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}

const imageAppendURL = 'https://image.tmdb.org/t/p/w500';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
