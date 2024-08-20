import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class ExUserOne extends StatefulWidget {
  @override
  _ExUserOneState createState() => _ExUserOneState();
}

class _ExUserOneState extends State<ExUserOne> {
  @override
  void initState() {
    super.initState();

    // 3초 후에 Home 화면으로 이동
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) =>
              Home(), // 다음 화면을 Home으로 지정
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

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
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Stack(
          children: [
            // 배경 설정
            Align(
              alignment: Alignment.center,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.751, -0.248),
                    end: Alignment(0.593, 0.417),
                    colors: <Color>[Color(0xBAE05454), Color(0xBAD70000)],
                    stops: <double>[0, 1],
                  ),
                ),
              ),
            ),
            // 나머지 UI 요소들
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(13 * widthRatio, 120 * heightRatio,
                    30.3 * widthRatio, 100 * heightRatio), // 패딩 조정
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          18.5 * widthRatio, 0, 0, 20 * heightRatio), // 마진 조정
                      width: 87 * widthRatio,
                      height: 87 * heightRatio,
                      child: SvgPicture.asset(
                        'assets/vectors/vector_28_x2.svg',
                      ),
                    ),
                    Text(
                      '이 승석님,\n다시 만나서 반가워요!',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 30 * widthRatio, // 폰트 크기 조정
                        color: const Color(0xFFFFFFFF),
                      ),
                      textAlign: TextAlign.center, // 텍스트 중앙 정렬
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
