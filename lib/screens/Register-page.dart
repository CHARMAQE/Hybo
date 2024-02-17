// ignore_for_file: prefer_const_constructors, file_names, depend_on_referenced_packages, unused_import, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamza/Auth.dart';
import 'package:hamza/screens/login-page.dart';
import 'package:hamza/screens/type-page.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  Future SignUp() async {
    if (_passwordcontroller.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const typepage()),
      );
    } else {
      print("incoorect pass");
    }
  }

  void openloginpage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const loginpage()),
    );
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
              SizedBox(height: 40),

              //image
              Image.asset(
                'images/3.png',
                height: 250,
              ),

              //Hello
              Text(
                'Hello There',
                style: GoogleFonts.gorditas(
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Register below with your details!',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _confirmpasswordcontroller,
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
                    hintText: 'Confirm password',
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: SignUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffFD353A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.gorditas(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
                    'I am a member?',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: openloginpage,
                    child: Text(
                      ' Login now',
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
