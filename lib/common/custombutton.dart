import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  Widget buildMenuButton(BuildContext context, String title, VoidCallback onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.jockeyOne(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      ),
    );
  }
