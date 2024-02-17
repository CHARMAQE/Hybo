// ignore_for_file: prefer_const_constructors, camel_case_types, depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class iconandtext extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const iconandtext(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black45,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
