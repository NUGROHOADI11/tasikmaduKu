import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final Icon icon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: GoogleFonts.poppins(
            color: cDarkGreenColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: clightgrey,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ]),
          height: 60.0,
          child: TextField(
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                prefixIcon: icon,
                prefixIconColor: Colors.grey[700],
                hintText: "Masukkan $hintText",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'OpenSans',
                )),
          ),
        ),
      ],
    );
  }
}
