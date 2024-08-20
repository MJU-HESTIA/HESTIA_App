import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// 해당 파일들을 import 합니다.
import 'home.dart';
import 'iot.dart';
import 'conversation.dart';
import 'edit_profile.dart';
import 'faq.dart';
import 'logout.dart';

class Setting extends StatelessWidget {
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
      backgroundColor: Color(0xFFEDEEF3), // 기본 배경색 설정
      body: Container(
        color: Color(0xFFEDEEF3), // 배경색 설정
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Color(0xFFEDEEF3), // 전체 배경색 설정
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 78 * heightRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * widthRatio, 0, 16 * widthRatio, 21 * heightRatio),
                    child: Text(
                      '환경 설정',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 40 * widthRatio,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  _buildSettingItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    svgPath: 'assets/vectors/vector_2_x2.svg',
                    label: '정보 수정',
                    onTap: () {
                      _navigateTo(context, EditProfile());
                    },
                  ),
                  SizedBox(height: 17 * heightRatio),
                  _buildSettingItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    svgPath: 'assets/vectors/vector_54_x2.svg',
                    label: '자주하는 질문',
                    onTap: () {
                      _navigateTo(context, Faq());
                    },
                  ),
                  SizedBox(height: 17 * heightRatio),
                  _buildSettingItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    svgPath: 'assets/vectors/vector_48_x2.svg',
                    label: '로그 아웃',
                    onTap: () {
                      _navigateTo(context, Logout());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x66D9D9D9),
            ),
            padding: EdgeInsets.symmetric(vertical: 15 * heightRatio),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_58_x2.svg',
                  label: '홈',
                  isSelected: false,
                  onTap: () {
                    _navigateToHome(context);
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_75_x2.svg',
                  label: '제어',
                  isSelected: false,
                  onTap: () {
                    _navigateToIot(context);
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/image_8_x2.svg',
                  label: '대화기록',
                  isSelected: false,
                  onTap: () {
                    _navigateToConversation(context);
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_70_x2.svg',
                  label: '설정',
                  isSelected: true,
                  onTap: () {}, // 현재 페이지이므로 동작 없음
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

  void _navigateToConversation(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Conversation(),
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

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required double widthRatio,
    required double heightRatio,
    required String svgPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16 * widthRatio),
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(4 * widthRatio),
        ),
        padding: EdgeInsets.fromLTRB(
            11.4 * widthRatio, 6.5 * heightRatio, 0, 6.5 * heightRatio),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 13.5 * widthRatio),
              width: 35 * widthRatio,
              height: 35 * heightRatio,
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 25 * widthRatio,
                color: Color(0xFF000000),
              ),
            ),
          ],
        ),
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
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
