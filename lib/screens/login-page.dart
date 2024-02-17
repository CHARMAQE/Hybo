// ignore_for_file: camel_case_types, file_names, unused_import, depend_on_referenced_packages, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamza/Auth.dart';
import 'package:hamza/screens/Register-page.dart';
import 'package:hamza/screens/forgotpass-page.dart';
import 'package:hamza/screens/type-page.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const typepage()),
    );
  }

  void opensignuppage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Registerpage()),
    );
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              //image
              Image.asset(
                'images/burger.png',
                height: 280,
              ),

              //Hello
              Text(
                'Hello Again',
                style: GoogleFonts.gorditas(
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Welcome back, you\'ve been missed!',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(height: 30),

              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFD353A)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.grey[200],
                    hintText: 'Email',
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFD353A)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.grey[200],
                    hintText: 'password',
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const forgotpasspage()),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 17,
                            color: Color(0xffFD353A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              //login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: SignIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffFD353A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.gorditas(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'I am new in Hybo?',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: opensignuppage,
                    child: Text(
                      ' Register Now',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xffFD353A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
