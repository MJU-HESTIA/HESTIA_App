import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'light_on.dart';
import 'light_off.dart';
import 'aircon_on.dart';
import 'aircon_off.dart';
import 'airclean_on.dart';
import 'airclean_off.dart';
import 'tv.dart';
import 'home.dart';
import 'conversation.dart';
import 'setting.dart';

class Iot extends StatefulWidget {
  @override
  _IotState createState() => _IotState();
}

class _IotState extends State<Iot> {
  bool isLightOn = true;
  bool isAirConditionerOn = false;
  bool isAirPurifierOn = false;
  bool isTvOn = false;

  void _toggleLightButton() {
    setState(() {
      isLightOn = !isLightOn;
    });
  }

  void _toggleAirConditionerButton() {
    setState(() {
      isAirConditionerOn = !isAirConditionerOn;
    });
  }

  void _toggleAirPurifierButton() {
    setState(() {
      isAirPurifierOn = !isAirPurifierOn;
    });
  }

  void _toggleTvButton() {
    setState(() {
      isTvOn = !isTvOn;
    });
  }

  void _navigateToLightPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isLightOn ? LightOn() : LightOff(),
      ),
    );
    if (result != null && result is bool) {
      setState(() {
        isLightOn = result;
      });
    }
  }

  void _navigateToAirconPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isAirConditionerOn ? AirconOn() : AirconOff(),
      ),
    );
    if (result != null && result is bool) {
      setState(() {
        isAirConditionerOn = result;
      });
    }
  }

  void _navigateToAirPurifierPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isAirPurifierOn ? AircleanOn() : AircleanOff(),
      ),
    );
    if (result != null && result is bool) {
      setState(() {
        isAirPurifierOn = result;
      });
    }
  }

  void _navigateToTvPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tv(isTvOn: isTvOn),
      ),
    );
    if (result != null) {
      setState(() {
        isTvOn = result;
      });
    }
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFEDEEF3),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 78, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                          16 * widthRatio, 49 * heightRatio),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '가전 제어',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 40 * widthRatio,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                          16 * widthRatio, 21 * heightRatio),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // 새로 추가된 Bluetooth 연결 버튼
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF9AB0DD),
                                borderRadius:
                                    BorderRadius.circular(20 * widthRatio),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    10.3 * widthRatio,
                                    14.5 * heightRatio,
                                    10.3 * widthRatio,
                                    14.5 * heightRatio),
                                child: Text(
                                  'Bluetooth연결',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20 * widthRatio,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8 * widthRatio), // 간격 추가
                            // 기존의 +기기추가 버튼
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD983),
                                borderRadius:
                                    BorderRadius.circular(20 * widthRatio),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    10.3 * widthRatio,
                                    14.5 * heightRatio,
                                    10.3 * widthRatio,
                                    14.5 * heightRatio),
                                child: Text(
                                  '+ 기기 추가',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20 * widthRatio,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 버튼 그룹을 중앙에 배치
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  if (details.localPosition.dy >
                                      (156 * heightRatio) / 2) {
                                    _navigateToLightPage(context);
                                  }
                                },
                                child: _buildControlButton(
                                  widthRatio: widthRatio,
                                  heightRatio: heightRatio,
                                  title: '조명',
                                  svgPath: 'assets/vectors/light_bulb_x2.svg',
                                  imagePath: isLightOn
                                      ? 'assets/vectors/vector_81_x2.svg'
                                      : 'assets/vectors/vector_69_x2.svg',
                                  isImage: false,
                                  onTap: _toggleLightButton,
                                ),
                              ),
                              SizedBox(width: 16 * widthRatio),
                              GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  if (details.localPosition.dy >
                                      (156 * heightRatio) / 2) {
                                    _navigateToAirconPage(context);
                                  }
                                },
                                child: _buildControlButton(
                                  widthRatio: widthRatio,
                                  heightRatio: heightRatio,
                                  title: '선풍기',
                                  svgPath: 'assets/images/image.png',
                                  imagePath: isAirConditionerOn
                                      ? 'assets/vectors/vector_81_x2.svg'
                                      : 'assets/vectors/vector_69_x2.svg',
                                  isImage: true,
                                  onTap: _toggleAirConditionerButton,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20 * heightRatio),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  if (details.localPosition.dy >
                                      (156 * heightRatio) / 2) {
                                    _navigateToAirPurifierPage(context);
                                  }
                                },
                                child: _buildControlButton(
                                  widthRatio: widthRatio,
                                  heightRatio: heightRatio,
                                  title: '공기청정기',
                                  svgPath: 'assets/images/image_2.png',
                                  imagePath: isAirPurifierOn
                                      ? 'assets/vectors/vector_81_x2.svg'
                                      : 'assets/vectors/vector_69_x2.svg',
                                  isImage: true,
                                  onTap: _toggleAirPurifierButton,
                                ),
                              ),
                              SizedBox(width: 16 * widthRatio),
                              GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  if (details.localPosition.dy >
                                      (156 * heightRatio) / 2) {
                                    _navigateToTvPage(context);
                                  }
                                },
                                child: _buildControlButton(
                                  widthRatio: widthRatio,
                                  heightRatio: heightRatio,
                                  title: '거실 TV',
                                  svgPath: 'assets/images/tv.png',
                                  imagePath: isTvOn
                                      ? 'assets/vectors/vector_81_x2.svg'
                                      : 'assets/vectors/vector_69_x2.svg',
                                  isImage: true,
                                  onTap: _toggleTvButton,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20 * heightRatio),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 28.5 * heightRatio),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          '누르면 더 자세한 제어가 가능해요!',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 20 * widthRatio,
                            color: Color(0xB2ED4545),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200 * heightRatio,
                color: Color(0xFFEDEEF3),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x99D9D9D9),
            ),
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
                    color: Color(0xCC777777),
                  ),
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_24_x2.svg',
                  label: '제어',
                  isSelected: true,
                  color: Color(0xFF000000),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToConversation(context);
                  },
                  child: _buildBottomNavigationItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    iconPath: 'assets/vectors/image_19_x2.svg',
                    label: '대화기록',
                    isSelected: false,
                    color: Color(0xCC777777),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToSettings(context);
                  },
                  child: _buildBottomNavigationItem(
                    context: context,
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
                    iconPath: 'assets/vectors/vector_16_x2.svg',
                    label: '설정',
                    isSelected: false,
                    color: Color(0xCC777777),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required double widthRatio,
    required double heightRatio,
    required String title,
    required String svgPath,
    required String imagePath,
    required bool isImage,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 156 * widthRatio,
      height: 156 * heightRatio,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20 * widthRatio),
        color: Color(0xF0D9D9D9),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4 * heightRatio),
            blurRadius: 2 * heightRatio,
          ),
        ],
      ),
      padding: EdgeInsets.all(10 * widthRatio),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 34 * heightRatio),
              child: SizedBox(
                width: 135 * widthRatio,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15 * widthRatio, 0),
                      child: SizedBox(
                        width: 55 * widthRatio,
                        height: 55 * heightRatio,
                        child: isImage
                            ? Image.asset(svgPath)
                            : SvgPicture.asset(svgPath),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            5 * widthRatio, 0, 0, 6.1 * heightRatio),
                        width: 55 * widthRatio,
                        height: 55 * heightRatio,
                        child: SvgPicture.asset(imagePath),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 22 * widthRatio,
                  color: Color(0xFF000000),
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
    required Color color,
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
            color: color,
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
