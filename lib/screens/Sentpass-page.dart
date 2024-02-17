// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, unused_import, depend_on_referenced_packages, sort_child_properties_last, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login-page.dart';

class sentpasspage extends StatefulWidget {
  const sentpasspage({super.key});

  @override
  State<sentpasspage> createState() => _sentpasspageState();
}

class _sentpasspageState extends State<sentpasspage> {
  void opensignuppage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const loginpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xffFD353A), //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              //Hello
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Email has been sent!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Please check your inbox and click in the received link to reset a password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              Image.asset(
                'images/resetpass.png',
                height: 250,
              ),

              SizedBox(height: 45),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: GestureDetector(
                  onTap: opensignuppage,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffFD353A),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.gorditas(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
