import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart'; // 홈 화면으로의 이동을 위해 import

class NewUserLogin extends StatefulWidget {
  final String userName;

  NewUserLogin({required this.userName}); // 생성자 추가

  @override
  _NewUserLoginState createState() => _NewUserLoginState();
}

class _NewUserLoginState extends State<NewUserLogin> {
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
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.751, -0.248),
            end: Alignment(0.593, 0.417),
            colors: <Color>[Color(0xBAE05454), Color(0xBAD70000)],
            stops: <double>[0, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            24 * widthRatio,
            120 * heightRatio,
            6.3 * widthRatio,
            100 * heightRatio,
          ), // 패딩 조정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                  0,
                  0,
                  18.7 * widthRatio,
                  20 * heightRatio,
                ),
                width: 87 * widthRatio,
                height: 87 * heightRatio,
                child: SvgPicture.asset(
                  'assets/vectors/vaadinuser_check_x2.svg',
                ),
              ),
              Flexible(
                child: Text(
                  '${widget.userName}님,\n등록이 완료되었어요.\n만나서 반가워요!',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 30 * widthRatio, // 폰트 크기 조정
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center, // 텍스트 중앙 정렬
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
