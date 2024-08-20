import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro.dart'; // intro.dart 파일을 import 합니다.

class Logout extends StatelessWidget {
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

    // 2초 후에 intro.dart로 이동
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Intro(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(seconds: 1), // 전환 시간 설정
        ),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.751, -0.248),
            end: Alignment(0.593, 0.417),
            colors: <Color>[Color(0xBAE05454), Color(0xBAD70000)],
            stops: <double>[0, 1],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 30 * heightRatio), // 아이콘과 텍스트 사이 간격 조정
              width: 87 * widthRatio,
              height: 87 * heightRatio,
              child: SvgPicture.asset(
                'assets/vectors/vector_56_x2.svg',
                width: 67.4 * widthRatio,
                height: 72.5 * heightRatio,
              ),
            ),
            Text(
              '로그아웃이\n완료되었어요!',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 35 * widthRatio, // 비율에 따른 텍스트 크기 조정
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
