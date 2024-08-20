import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ex_user_one.dart';
import 'ex_user_two.dart';
import 'ex_user_three.dart';
import 'new_user_in.dart';

class Login extends StatelessWidget {
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
            // attention_x2.svg 위치 설정
            Positioned(
              left: -55 * widthRatio,
              top: 454 * heightRatio,
              child: SizedBox(
                width: 245 * widthRatio,
                height: 154 * heightRatio,
                child: SvgPicture.asset(
                  'assets/vectors/attention_x2.svg',
                ),
              ),
            ),
            // attention_2_x2.svg 위치 설정
            Positioned(
              left: -10 * widthRatio,
              top: -48 * heightRatio,
              child: SizedBox(
                width: 164.7 * widthRatio,
                height: 151.5 * heightRatio,
                child: SvgPicture.asset(
                  'assets/vectors/attention_2_x2.svg',
                ),
              ),
            ),
            // 나머지 UI 요소들
            Container(
              padding: EdgeInsets.fromLTRB(18 * widthRatio, 108 * heightRatio,
                  16 * widthRatio, 100 * heightRatio), // 패딩 조정
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        2 * widthRatio, 0, 0.2 * widthRatio, 13 * heightRatio),
                    child: Text(
                      '혹시 전에 사용하셨던 적 \n있으신가요?',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 30 * widthRatio,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        2 * widthRatio, 0, 2 * widthRatio, 25 * heightRatio),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '아래에 성함이 있다면 눌러주세요',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 22 * widthRatio,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  _buildNameButton(
                      context, '이 승석', ExUserOne(), widthRatio, heightRatio),
                  _buildNameButton(
                      context, '사용자2', ExUserTwo(), widthRatio, heightRatio),
                  _buildNameButton(
                      context, '사용자3', ExUserThree(), widthRatio, heightRatio),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 0, 20 * heightRatio), // 하단 마진 줄임
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "처음이시라면,\n‘등록하기’를 눌러주세요",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 30 * widthRatio,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    NewUserIn(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * widthRatio),
                          color: Color(0xFFFFBDA1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 4 * heightRatio),
                              blurRadius: 2 * heightRatio,
                            ),
                          ],
                        ),
                        child: Container(
                          width: 148 * widthRatio,
                          alignment: Alignment.center, // 텍스트를 중앙에 배치
                          padding:
                              EdgeInsets.symmetric(vertical: 10 * heightRatio),
                          child: Text(
                            '등록하기',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 25 * widthRatio,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameButton(BuildContext context, String name, Widget nextPage,
      double widthRatio, double heightRatio) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => nextPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 4 * widthRatio, 12 * heightRatio),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * widthRatio),
          color: Color(0xFFD9D9D9),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4 * heightRatio),
              blurRadius: 2 * heightRatio,
            ),
          ],
        ),
        child: Container(
          width: 284 * widthRatio,
          padding: EdgeInsets.fromLTRB(
              0, 3.5 * heightRatio, 0.7 * widthRatio, 3.5 * heightRatio),
          alignment: Alignment.center, // 텍스트를 중앙에 배치
          child: Text(
            name,
            style: GoogleFonts.getFont(
              'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 30 * widthRatio,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}
