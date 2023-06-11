import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildButton(String label) {
  return Container(
    width: 173,
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF598BED)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton.icon(
      onPressed: () {},
      icon: const Padding(
        padding: EdgeInsets.fromLTRB(1, 0, 8, 0),
        child: Icon(
          Icons.download,
          size: 24.0,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF598BED),
      ),
      label: Expanded(
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    ),
  );
}