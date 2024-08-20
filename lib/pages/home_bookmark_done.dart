import 'dart:async'; // Timer를 사용하기 위해 추가
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart'; // Home 화면을 import

class HomeBookmarkDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면 크기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기준 해상도
    double baseWidth = 360;
    double baseHeight = 800;

    // 비율 계산
    double widthRatio = (screenWidth / baseWidth) * 0.9; // 크기 조정
    double heightRatio = (screenHeight / baseHeight) * 0.9; // 크기 조정

    // 3초 후에 Home 화면으로 전환
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Home(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, -1.0); // 위에서 아래로 슬라이드
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 34 * heightRatio, 0, 0), // 비율에 따른 패딩 조정
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xFFEDEEF3),
                      padding: EdgeInsets.symmetric(
                          vertical: 44 * heightRatio,
                          horizontal: 16 * widthRatio), // 비율에 따른 패딩 조정
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '즐겨찾는 기능',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 40 * widthRatio, // 비율에 따른 텍스트 크기 조정
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 49 * heightRatio), // 비율에 따른 간격 조정
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFADCFAC),
                              borderRadius:
                                  BorderRadius.circular(20 * widthRatio),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 14.5 * heightRatio,
                                horizontal: 12.4 * widthRatio),
                            child: Text(
                              '+ 즐겨찾기 추가',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 20 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          SizedBox(height: 21 * heightRatio), // 비율에 따른 간격 조정
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * widthRatio),
                                    color: Color(0x80D9D9D9),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4 * heightRatio),
                                        blurRadius: 2 * heightRatio,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                      10 * widthRatio,
                                      15 * heightRatio,
                                      13.1 * widthRatio,
                                      26 * heightRatio), // 비율에 따른 패딩 조정
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/vectors/light_bulb_5_x2.svg',
                                            width: 55 * widthRatio,
                                            height: 55 * heightRatio,
                                          ),
                                          SvgPicture.asset(
                                            'assets/vectors/vector_8_x2.svg',
                                            width: 48.9 * widthRatio,
                                            height: 48.9 * heightRatio,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              34 * heightRatio), // 비율에 따른 간격 조정
                                      Text(
                                        '조명',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22 *
                                              widthRatio, // 비율에 따른 텍스트 크기 조정
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 16 * widthRatio), // 비율에 따른 간격 조정
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * widthRatio),
                                    color: Color(0x80D9D9D9),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4 * heightRatio),
                                        blurRadius: 2 * heightRatio,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                      8 * widthRatio,
                                      13 * heightRatio,
                                      11.1 * widthRatio,
                                      28 * heightRatio), // 비율에 따른 패딩 조정
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/image_1.png'),
                                              ),
                                            ),
                                            width: 55 * widthRatio,
                                            height: 55 * heightRatio,
                                          ),
                                          SvgPicture.asset(
                                            'assets/vectors/vector_77_x2.svg',
                                            width: 48.9 * widthRatio,
                                            height: 48.9 * heightRatio,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              34 * heightRatio), // 비율에 따른 간격 조정
                                      Text(
                                        '에어컨',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22 *
                                              widthRatio, // 비율에 따른 텍스트 크기 조정
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 44.5 * heightRatio), // 비율에 따른 간격 조정
                          Text(
                            '누르면 더 자세한 제어가 가능해요!',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 20 * widthRatio, // 비율에 따른 텍스트 크기 조정
                              color: Color(0xB2ED4545),
                            ),
                          ),
                          SizedBox(height: 15 * heightRatio), // 비율에 따른 간격 조정
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20 * widthRatio),
                              gradient: LinearGradient(
                                begin: Alignment(0, -1),
                                end: Alignment(0, 1),
                                colors: [Color(0x66EAC0C0), Color(0x66EDADAD)],
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                9.5 * widthRatio,
                                21 * heightRatio,
                                19.5 * widthRatio,
                                20 * heightRatio), // 비율에 따른 패딩 조정
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/vectors/group_13_x2.svg',
                                      width: 45 * widthRatio,
                                      height: 48 * heightRatio,
                                    ),
                                    SizedBox(
                                        width:
                                            6.3 * widthRatio), // 비율에 따른 간격 조정
                                    Text(
                                      '도와드릴까요',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            18 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                        color: Color(0xB2ED4545),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 25 * heightRatio), // 비율에 따른 간격 조정
                                Text(
                                  '혹시 HESTIA가 잘 알아듣지 못하나요?\n문장 앞에 HESTIA를 붙여보세요',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        18 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60 * heightRatio, // 비율에 따른 위치 조정
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40 * widthRatio),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10 * widthRatio, sigmaY: 10 * heightRatio),
                child: Container(
                  width: double.infinity,
                  height: screenHeight - 20 * heightRatio, // 비율에 따른 높이 조정
                  decoration: BoxDecoration(
                    color: Color(0xCC777777),
                    borderRadius: BorderRadius.circular(40 * widthRatio),
                  ),
                  child: Align(
                    alignment: Alignment(0, -0.4),
                    child: Text(
                      '즐겨찾기에 \n추가 되었어요!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 40 * widthRatio, // 비율에 따른 텍스트 크기 조정
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
