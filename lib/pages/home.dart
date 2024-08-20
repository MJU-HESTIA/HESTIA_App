import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_bookmark.dart'; // 새 화면을 나타내는 파일을 import
import 'light_on.dart'; // Light On 페이지
import 'light_off.dart'; // Light Off 페이지
import 'aircon_on.dart'; // AirCon On 페이지
import 'aircon_off.dart'; // AirCon Off 페이지
import 'iot.dart'; // IoT 페이지
import 'conversation.dart'; // Conversation 페이지
import 'setting.dart'; // Setting 페이지

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLightOn = true;
  bool isAirConditionerOn = false;

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

  void _navigateToBookmark(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeBookmark(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
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

  String getLightStatus() {
    return isLightOn ? 'ON' : 'OFF';
  }

  String getAirConditionerStatus() {
    return isAirConditionerOn ? 'ON' : 'OFF';
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
        // 스크롤 가능하도록 수정
        padding: EdgeInsets.only(bottom: 80 * heightRatio),
        child: Container(
          color: Color(0xFFEDEEF3), // 전체 배경색
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단의 빈 영역 (기존 AppBar 자리에 해당)
              SizedBox(height: 50 * heightRatio),
              Container(
                margin: EdgeInsets.fromLTRB(16 * widthRatio, 16 * heightRatio,
                    16 * widthRatio, 49 * heightRatio),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '즐겨찾는 기능',
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
                margin: EdgeInsets.fromLTRB(
                    16 * widthRatio, 0, 16 * widthRatio, 21 * heightRatio),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => _navigateToBookmark(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFADCFAC),
                        borderRadius: BorderRadius.circular(20 * widthRatio),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            12.3 * widthRatio,
                            14.5 * heightRatio,
                            12.3 * widthRatio,
                            14.5 * heightRatio),
                        child: Text(
                          '+ 즐겨찾기 추가',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * widthRatio,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    16 * widthRatio, 0, 16 * widthRatio, 38.5 * heightRatio),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTapDown: (TapDownDetails details) {
                            double boxHeight = 156 * heightRatio;
                            if (details.localPosition.dy > boxHeight / 2) {
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
                        GestureDetector(
                          onTapDown: (TapDownDetails details) {
                            double boxHeight = 156 * heightRatio;
                            if (details.localPosition.dy > boxHeight / 2) {
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
                    SizedBox(height: 20 * heightRatio), // 텍스트와 버튼 간격 추가
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          22.6 * widthRatio, 0, 26.6 * widthRatio, 0),
                      child: Text(
                        '누르면 더 자세한 제어가 가능해요!',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 19 * widthRatio,
                          color: Color(0xB2ED4545),
                        ),
                        softWrap: false, // 자동 줄바꿈 방지
                        overflow: TextOverflow.ellipsis, // 텍스트가 길 경우 생략
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    16 * widthRatio, 0, 16 * widthRatio, 15 * heightRatio),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * widthRatio),
                    gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: <Color>[Color(0x66EAC0C0), Color(0x66EDADAD)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          9.5 * widthRatio,
                          21 * heightRatio,
                          19.5 * widthRatio,
                          20 * heightRatio),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5 * widthRatio, 0,
                                5 * widthRatio, 25 * heightRatio),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0, 0, 6.3 * widthRatio, 0),
                                    width: 45 * widthRatio,
                                    height: 48 * heightRatio,
                                    child: SizedBox(
                                      width: 33.8 * widthRatio,
                                      height: 36 * heightRatio,
                                      child: SvgPicture.asset(
                                        'assets/vectors/group_7_x2.svg',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0, 15 * heightRatio, 0, 0),
                                    child: Text(
                                      '도와드릴까요',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18 * widthRatio,
                                        color: Color(0xB2ED4545),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '혹시 HESTIA가 잘 알아듣지 못하나요?\n문장 앞에 HESTIA를 붙여보세요',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 18 * widthRatio,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // 스크롤 시 이어지는 EDEEF3색 배경 영역
              Container(
                height: 500 * heightRatio,
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
                  iconPath: 'assets/vectors/vector_14_x2.svg',
                  label: '홈',
                  isSelected: true,
                  onTap: () {}, // 홈은 현재 페이지이므로 동작 없음
                ),
                _buildBottomNavigationItem(
                  context: context,
                  widthRatio: widthRatio,
                  heightRatio: heightRatio,
                  iconPath: 'assets/vectors/vector_50_x2.svg',
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
                  iconPath: 'assets/vectors/image_9_x2.svg',
                  label: '설정',
                  isSelected: false,
                  onTap: () {
                    _navigateToSettings(context);
                  },
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        width: 156 * widthRatio,
        height: 156 * heightRatio,
        padding: EdgeInsets.all(10 * widthRatio),
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
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 15 * widthRatio, 0), // 오른쪽으로 이동
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
                        margin: EdgeInsets.fromLTRB(5 * widthRatio, 0, 0,
                            6.1 * heightRatio), // 오른쪽으로 이동
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
      ),
    );
  }
}
