import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'light_on.dart'; // light_on.dart 파일을 import

class LightOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면의 크기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기준 해상도 (Figma에서 설정한 크기)
    double baseWidth = 360;
    double baseHeight = 800;

    // 비율 계산
    double widthRatio = screenWidth / baseWidth;
    double heightRatio = screenHeight / baseHeight;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 34,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Color(0x80777777), // EDEEF3색을 777777색으로 변경, 불투명도 50%
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 78, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 46),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              '가전 제어',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false); // 조명 Off 상태를 전달
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF777777), // 버튼 색상 변경
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              width: 135,
                              height: 60,
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SvgPicture.asset(
                                        'assets/vectors/group_14_x2.svg',
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '뒤로',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 101),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 55,
                            height: 55,
                            child: SvgPicture.asset(
                              'assets/vectors/light_bulb_1_x2.svg',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 13, 0, 13),
                            child: Text(
                              '조명이 꺼져 있어요!',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LightOn(), // light_on.dart 페이지로 이동
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration:
                              Duration(milliseconds: 500), // 0.5초 동안 오버랩
                        ),
                      ).then((result) {
                        Navigator.pop(context, result); // 조명 On 상태를 전달
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(22, 0, 26, 104.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 22.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF777777), // 버튼 색상 변경
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Container(
                              width: 312,
                              height: 144,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '눌러서 노란색으로 변하면\n조명이 켜져요',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(), // Bottom Bar가 화면의 하단에 위치하도록 추가
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x99D9D9D9),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 15 * heightRatio), // 상하 padding을 동일하게
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildBottomNavigationItem(
                          context: context,
                          widthRatio: widthRatio,
                          heightRatio: heightRatio,
                          iconPath: 'assets/vectors/vector_3_x2.svg',
                          label: '홈',
                          isSelected: false,
                          color: Color(0xCC777777),
                        ),
                        _buildBottomNavigationItem(
                          context: context,
                          widthRatio: widthRatio,
                          heightRatio: heightRatio,
                          iconPath: 'assets/vectors/vector_43_x2.svg',
                          label: '제어',
                          isSelected: true,
                          color: Color(0xFF000000),
                        ),
                        _buildBottomNavigationItem(
                          context: context,
                          widthRatio: widthRatio,
                          heightRatio: heightRatio,
                          iconPath: 'assets/vectors/image_21_x2.svg',
                          label: '대화기록',
                          isSelected: false,
                          color: Color(0xCC777777),
                        ),
                        _buildBottomNavigationItem(
                          context: context,
                          widthRatio: widthRatio,
                          heightRatio: heightRatio,
                          iconPath: 'assets/vectors/vector_60_x2.svg',
                          label: '설정',
                          isSelected: false,
                          color: Color(0xCC777777),
                        ),
                      ],
                    ),
                  ),
                ),
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
    required Color color, // 아이콘 색상 추가
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
            color: color, // 색상 적용
          ),
        ),
        SizedBox(height: 8 * heightRatio), // 아이콘과 텍스트 사이의 간격 조정
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
