// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, unused_field, prefer_final_fields, sized_box_for_whitespace, depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:hamza/screens/login-page.dart';
import 'package:google_fonts/google_fonts.dart';

class intropage extends StatefulWidget {
  const intropage({super.key});

  @override
  State<intropage> createState() => _intropageState();
}

class _intropageState extends State<intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  height: 220,
                  child: Center(
                    child: Text(
                      'Hybo',
                      style: GoogleFonts.allura(
                        textStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Get\nYour delivery food!',
                      style: GoogleFonts.gorditas(
                        textStyle: TextStyle(
                          fontSize: 58,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginpage()),
                    );
                  },
                  child: Container(
                    height: 75,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Color(0xffFD353A),
                      borderRadius: BorderRadius.circular(12),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 5,
                          //offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.gorditas(
                          textStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
