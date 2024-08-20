import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_bookmark_done.dart'; // home_bookmark_done.dart 파일을 임포트

class HomeBookmark extends StatefulWidget {
  @override
  _HomeBookmarkState createState() => _HomeBookmarkState();
}

class _HomeBookmarkState extends State<HomeBookmark> {
  bool isAirPurifierActive = false;
  bool isLivingRoomTVActive = false;

  void toggleAirPurifier() {
    setState(() {
      isAirPurifierActive = !isAirPurifierActive;
    });
  }

  void toggleLivingRoomTV() {
    setState(() {
      isLivingRoomTVActive = !isLivingRoomTVActive;
    });
  }

  void navigateToHome() {
    Navigator.of(context).pop(); // 현재 화면을 종료하고 이전 화면(home.dart)으로 이동
  }

  void navigateToBookmarkDone() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeBookmarkDone()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 화면 크기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기준 해상도
    double baseWidth = 360;
    double baseHeight = 800;

    // 비율 계산
    double widthRatio = (screenWidth / baseWidth) * 0.9; // 크기 조정
    double heightRatio = (screenHeight / baseHeight) * 0.9; // 크기 조정

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Localizations.override(
        context: context,
        locale: Locale('en', 'US'), // 기본 텍스트 방향을 LTR로 설정
        child: Container(
          padding:
              EdgeInsets.fromLTRB(0, 34 * heightRatio, 0, 0), // 비율에 따른 패딩 조정
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEDEEF3),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        0, 44 * heightRatio, 0, 0), // 비율에 따른 패딩 조정
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              16 * widthRatio, 49 * heightRatio),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '즐겨찾는 기능',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 40 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                color: Color(0xFF000000),
                                textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              16 * widthRatio, 21 * heightRatio),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFADCFAC),
                              borderRadius:
                                  BorderRadius.circular(20 * widthRatio),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  12.4 * widthRatio,
                                  14.5 * heightRatio,
                                  12.4 * widthRatio,
                                  14.5 * heightRatio),
                              child: Text(
                                '+ 즐겨찾기 추가',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                  color: Color(0xFF000000),
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              16 * widthRatio, 19.5 * heightRatio),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: toggleAirPurifier,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0, 0, 16 * widthRatio, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20 * widthRatio),
                                      color: Color(0x80D9D9D9),
                                      border: isAirPurifierActive
                                          ? Border.all(
                                              color: Colors.black, width: 4)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(
                                              0, 4 * heightRatio), // 비율 조정
                                          blurRadius: 2 * heightRatio,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10 * widthRatio,
                                          15 * heightRatio,
                                          13.1 * widthRatio,
                                          26 * heightRatio),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 34 * heightRatio),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 55 * widthRatio,
                                                  height: 55 * heightRatio,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/light_bulb_4_x2.svg',
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0,
                                                      0, 0, 6.1 * heightRatio),
                                                  width: 55 * widthRatio,
                                                  height: 55 * heightRatio,
                                                  child: SizedBox(
                                                    width: 48.9 * widthRatio,
                                                    height: 48.9 * heightRatio,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_40_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '조명',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xFF000000),
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: toggleLivingRoomTV,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20 * widthRatio),
                                      color: Color(0x80D9D9D9),
                                      border: isLivingRoomTVActive
                                          ? Border.all(
                                              color: Colors.black, width: 4)
                                          : null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(
                                              0, 4 * heightRatio), // 비율 조정
                                          blurRadius: 2 * heightRatio,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          8 * widthRatio,
                                          13 * heightRatio,
                                          11.1 * widthRatio,
                                          28 * heightRatio),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 34 * heightRatio),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0,
                                                        0,
                                                        33 * widthRatio,
                                                        0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/images/image_1.png',
                                                          ),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        height:
                                                            55 * heightRatio,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0,
                                                      0, 0, 6.1 * heightRatio),
                                                  width: 55 * widthRatio,
                                                  height: 55 * heightRatio,
                                                  child: SizedBox(
                                                    width: 48.9 * widthRatio,
                                                    height: 48.9 * heightRatio,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_6_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              '에어컨 ',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xFF000000),
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
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
                          margin: EdgeInsets.fromLTRB(33.6 * widthRatio, 0,
                              33.6 * widthRatio, 44.5 * heightRatio),
                          child: Text(
                            '누르면 더 자세한 제어가 가능해요!',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 20 * widthRatio, // 비율에 따른 텍스트 크기 조정
                              color: Color(0xB2ED4545),
                              textStyle: TextStyle(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * widthRatio, 0,
                              16 * widthRatio, 15 * heightRatio),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20 * widthRatio),
                              gradient: LinearGradient(
                                begin: Alignment(0, -1),
                                end: Alignment(0, 1),
                                colors: <Color>[
                                  Color(0x66EAC0C0),
                                  Color(0x66EDADAD)
                                ],
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
                                      margin: EdgeInsets.fromLTRB(
                                          5 * widthRatio,
                                          0,
                                          5 * widthRatio,
                                          25 * heightRatio),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  'assets/vectors/group_8_x2.svg',
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
                                                  fontSize: 18 *
                                                      widthRatio, // 비율에 따른 텍스트 크기 조정
                                                  color: Color(0xB2ED4545),
                                                  textStyle: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
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
                                        fontSize:
                                            18 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                        height: 1,
                                        color: Color(0xFF000000),
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10 * widthRatio, // 비율 조정
                              sigmaY: 10 * heightRatio,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x66D9D9D9),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    31.3 * widthRatio,
                                    24 * heightRatio,
                                    27 * widthRatio,
                                    31.5 * heightRatio),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0, 0, 0, 9.5 * heightRatio),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                5.2 * heightRatio,
                                                47.6 * widthRatio,
                                                6.2 * heightRatio),
                                            width: 50 * widthRatio,
                                            height: 50 * heightRatio,
                                            child: SizedBox(
                                              width: 37.5 * widthRatio,
                                              height: 39.6 * heightRatio,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_26_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                5.2 * heightRatio,
                                                38 * widthRatio,
                                                0),
                                            width: 50 * widthRatio,
                                            height: 50 * heightRatio,
                                            child: SizedBox(
                                              width: 41.7 * widthRatio,
                                              height: 45.8 * heightRatio,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_63_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                39 * widthRatio,
                                                1 * heightRatio),
                                            child: SizedBox(
                                              width: 50 * widthRatio,
                                              height: 50 * heightRatio,
                                              child: SvgPicture.asset(
                                                'assets/vectors/image_24_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                1 * heightRatio,
                                                0,
                                                2 * heightRatio),
                                            child: SizedBox(
                                              width: 48 * widthRatio,
                                              height: 48 * heightRatio,
                                              child: SvgPicture.asset(
                                                'assets/vectors/image_26_x2.svg',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          5.6 * widthRatio,
                                          0,
                                          5.6 * widthRatio,
                                          0),
                                      child: SizedBox(
                                        width: 286.6 * widthRatio,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 11.5 * widthRatio, 0),
                                              child: SizedBox(
                                                width: 56 * widthRatio,
                                                child: Text(
                                                  '홈',
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20 *
                                                        widthRatio, // 비율에 따른 텍스트 크기 조정
                                                    color: Color(0xFF000000),
                                                    textStyle: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '제어',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xCC777777),
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '대화기록',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xCC777777),
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '설정',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xCC777777),
                                                textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                ),
              ),
              Positioned(
                top: 30 * heightRatio,
                left: (screenWidth / 2) - (screenWidth / 2), // 화면 중앙으로 위치 조정
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(40 * widthRatio), // 모서리를 둥글게
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10 * widthRatio,
                      sigmaY: 10 * heightRatio,
                    ),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40 * widthRatio),
                        color: Color(0xCC777777), // #777777 색상에 불투명도 80%
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17 * widthRatio,
                            30 * heightRatio, 18 * widthRatio, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(9 * widthRatio, 0,
                                  9 * widthRatio, 40 * heightRatio),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '즐겨찾기에 \n추가할 기기를 \n선택해주세요',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        40 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                    color: Color(0xFFFFFFFF),
                                    textStyle: TextStyle(
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: toggleAirPurifier,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0, 0, 0, 27 * heightRatio),
                                decoration: BoxDecoration(
                                  color: Color(0x80D9D9D9),
                                  borderRadius:
                                      BorderRadius.circular(20 * widthRatio),
                                  border: isAirPurifierActive
                                      ? Border.all(
                                          color: Colors.black, width: 4)
                                      : null,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      20 * widthRatio,
                                      15 * heightRatio,
                                      20 * widthRatio,
                                      15 * heightRatio), // 높이를 줄이고 padding 조정
                                  child: Center(
                                    child: Text(
                                      '공기청정기',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            28 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                        color: Color(0xFF000000),
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: toggleLivingRoomTV,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0, 0, 0, 24 * heightRatio),
                                decoration: BoxDecoration(
                                  color: Color(0x80D9D9D9),
                                  borderRadius:
                                      BorderRadius.circular(20 * widthRatio),
                                  border: isLivingRoomTVActive
                                      ? Border.all(
                                          color: Colors.black, width: 4)
                                      : null,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      20 * widthRatio,
                                      15 * heightRatio,
                                      20 * widthRatio,
                                      15 * heightRatio), // 높이를 줄이고 padding 조정
                                  child: Center(
                                    child: SizedBox(
                                      width: 160 * widthRatio, // 버튼의 가로 길이 조정
                                      child: Text(
                                        '거실 TV',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28 *
                                              widthRatio, // 비율에 따른 텍스트 크기 조정
                                          color: Color(0xFF000000),
                                          textStyle: TextStyle(
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(9 * widthRatio, 0,
                                  9 * widthRatio, 216 * heightRatio),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '한번 누르면 선택되고\n한번 더 누르면 선택 취소돼요',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        20 * widthRatio, // 비율에 따른 텍스트 크기 조정
                                    color: Color(0xFFFFFFFF),
                                    textStyle: TextStyle(
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(2 * widthRatio, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  width: 285 * widthRatio,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: navigateToHome,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0, 2 * heightRatio, 0, 0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF535151),
                                            borderRadius: BorderRadius.circular(
                                                20 * widthRatio),
                                          ),
                                          child: SizedBox(
                                            width: 115 * widthRatio,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 14.5 * heightRatio),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/vectors/group_5_x2.svg',
                                                    width: 18.8 * widthRatio,
                                                    height: 15 * heightRatio,
                                                  ),
                                                  SizedBox(
                                                      width: 8 *
                                                          widthRatio), // 간격 조정
                                                  Text(
                                                    '취소',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20 *
                                                          widthRatio, // 비율에 따른 텍스트 크기 조정
                                                      color: Color(0xFF000000),
                                                      textStyle: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: navigateToBookmarkDone,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0, 0, 0, 2 * heightRatio),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFADCFAC),
                                            borderRadius: BorderRadius.circular(
                                                20 * widthRatio),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                18.2 * widthRatio,
                                                14.5 * heightRatio,
                                                18.2 * widthRatio,
                                                14.5 * heightRatio),
                                            child: Text(
                                              '선택 완료',
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20 *
                                                    widthRatio, // 비율에 따른 텍스트 크기 조정
                                                color: Color(0xFF000000),
                                                textStyle: TextStyle(
                                                  decoration: TextDecoration
                                                      .none, // 노란색 밑줄 제거
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
