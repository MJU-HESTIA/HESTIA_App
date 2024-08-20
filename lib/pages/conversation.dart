import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart'; // Home 페이지
import 'iot.dart'; // IoT 페이지
import 'setting.dart'; // Setting 페이지

class Conversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면 크기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기준 해상도
    double baseWidth = 360;
    double baseHeight = 800;

    // 비율 계산
    double widthRatio = screenWidth / baseWidth;
    double heightRatio = screenHeight / baseHeight;

    return Scaffold(
      body: Container(
        color: Color(0xFFEDEEF3), // 기본 배경색을 설정
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80 * heightRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 78 * heightRatio),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              16 * widthRatio, 18.5 * heightRatio),
                          child: Text(
                            '대화 기록',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 40 * widthRatio,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20 * widthRatio, 0,
                              20 * widthRatio, 33.5 * heightRatio),
                          child: Text(
                            '지금까지 나눴던 대화예요\n빠짐없이 다 기억하고 있어요',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 20 * widthRatio,
                              color: Color(0xB2ED4545),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10 * widthRatio, 0,
                              10 * widthRatio, 35 * heightRatio),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF9AB0DD),
                                borderRadius:
                                    BorderRadius.circular(20 * widthRatio),
                              ),
                              padding: EdgeInsets.fromLTRB(
                                  16.5 * widthRatio,
                                  10.5 * heightRatio,
                                  11.5 * widthRatio,
                                  10.5 * heightRatio),
                              child: Text(
                                'HESTIA, 오늘 날씨 알려줘',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20 * widthRatio,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              25 * widthRatio, 244 * heightRatio),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20 * widthRatio),
                                topRight: Radius.circular(20 * widthRatio),
                                bottomRight: Radius.circular(20 * widthRatio),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                15 * widthRatio,
                                23 * heightRatio,
                                15 * widthRatio,
                                23 * heightRatio),
                            child: Text(
                              '오늘 서울의 기온은 맑으며,\n기온은 24.96도입니다.\n체감 온도는 25.97도 입니다.',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20 * widthRatio,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 스크롤 시 이어지는 배경 영역
                  Container(
                    height: 500 * heightRatio,
                    color: Color(0xFFEDEEF3), // 배경색을 스크롤과 동일하게 설정
                  ),
                ],
              ),
            ),
            // 상단에 다른 색이 보이는 부분 수정
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 34 * heightRatio,
              child: Container(
                color: Color(0xFFEDEEF3),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(color: Color(0x66D9D9D9)),
            padding: EdgeInsets.symmetric(vertical: 15 * heightRatio),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigateToHome(context);
                  },
                  child: _buildBottomNavigationItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    iconPath: 'assets/vectors/vector_58_x2.svg',
                    label: '홈',
                    isSelected: false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToIot(context);
                  },
                  child: _buildBottomNavigationItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    iconPath: 'assets/vectors/vector_75_x2.svg',
                    label: '제어',
                    isSelected: false,
                  ),
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/image_13_x2.svg',
                  label: '대화기록',
                  isSelected: true,
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToSettings(context);
                  },
                  child: _buildBottomNavigationItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    iconPath: 'assets/vectors/vector_33_x2.svg',
                    label: '설정',
                    isSelected: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Home(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 200),
      ),
    );
  }

  void _navigateToIot(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Iot(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 200),
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Setting(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 200),
      ),
    );
  }

  Widget _buildBottomNavigationItem({
    required BuildContext context,
    required double widthRatio,
    required double heightRatio,
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50 * widthRatio,
          height: 50 * heightRatio,
          child: SvgPicture.asset(
            iconPath,
            color: isSelected ? Color(0xFF000000) : Color(0xCC777777),
          ),
        ),
        SizedBox(height: 8 * heightRatio),
        Text(
          label,
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 20 * widthRatio,
            color: isSelected ? Color(0xFF000000) : Color(0xCC777777),
          ),
        ),
      ],
    );
  }
}
