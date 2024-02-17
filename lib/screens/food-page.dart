// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamza/widget/icon-and-text-widget.dart';
import 'package:dots_indicator/dots_indicator.dart';

class foodpagebody extends StatefulWidget {
  const foodpagebody({super.key});

  @override
  State<foodpagebody> createState() => _foodpagebodyState();
}

class _foodpagebodyState extends State<foodpagebody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currpagevalue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currpagevalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slide section
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, Position) {
              return _buildpageItem(Position);
            },
          ),
        ),
        //Dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currpagevalue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        SizedBox(
          height: 15,
        ),
        //Popular text
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Popular',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: Text(
                  '.',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 1.5),
                child: Text(
                  'Food Pairing',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //List of Food and Image
        Container(
          height: 700,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      //Image
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/food0.jpg"))),
                      ),
                      //Text
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nutritious fruit meal in china',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'With Chinese characteristics',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    iconandtext(
                                      icon: Icons.circle_sharp,
                                      text: 'Normal',
                                      iconColor: Color(0xFFffd28d),
                                    ),
                                    iconandtext(
                                      icon: Icons.location_on,
                                      text: '1.7km',
                                      iconColor: Color(0xffFD353A),
                                    ),
                                    iconandtext(
                                      icon: Icons.access_time_rounded,
                                      text: '30min',
                                      iconColor: Color(0xFFfcab58),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildpageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currpagevalue.floor()) {
      var currScale = 1 - (_currpagevalue - index) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currpagevalue.floor() + 1) {
      var currScale =
          _scaleFactor - (_currpagevalue - index + 1) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currpagevalue.floor() - 1) {
      var currScale = 1 - (_currpagevalue - index) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((30)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/food0.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 28, right: 28, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: []),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Burger',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: Color(0xffFD353A),
                                size: 15,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.5',
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '12000 comments',
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconandtext(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: Color(0xFFffd28d),
                        ),
                        iconandtext(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: Color(0xffFD353A),
                        ),
                        iconandtext(
                          icon: Icons.access_time_rounded,
                          text: '30min',
                          iconColor: Color(0xFFfcab58),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
