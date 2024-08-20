import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'iot.dart';
import 'conversation.dart';
import 'setting.dart';

class Faq extends StatelessWidget {
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
            Padding(
              padding: EdgeInsets.only(top: 78 * heightRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * widthRatio, 0, 16 * widthRatio, 536 * heightRatio),
                    child: Text(
                      '자주하는 질문',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 40 * widthRatio,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Spacer(), // 빈 공간을 차지하도록 Spacer 추가
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
                  iconPath: 'assets/vectors/vector_32_x2.svg',
                  label: '홈',
                  isSelected: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_10_x2.svg',
                  label: '제어',
                  isSelected: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Iot()),
                    );
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/image_10_x2.svg',
                  label: '대화기록',
                  isSelected: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Conversation()),
                    );
                  },
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_70_x2.svg',
                  label: '설정',
                  isSelected: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  },
                ),
              ],
            ),
          ),
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
