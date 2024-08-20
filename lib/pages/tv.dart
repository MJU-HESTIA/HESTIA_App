import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Tv extends StatefulWidget {
  final bool isTvOn;

  Tv({required this.isTvOn});

  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  bool isTvOn = false;

  @override
  void initState() {
    super.initState();
    isTvOn = widget.isTvOn;
  }

  void _toggleTvPower() {
    setState(() {
      isTvOn = !isTvOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 크기 계산
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기준 해상도 설정
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
            // EDEEF3 배경색 조정
            Positioned(
              top: 34,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Color(0xFFEDEEF3),
              ),
            ),
            // 텍스트와 버튼 조정
            Container(
              padding: EdgeInsets.fromLTRB(0, 78 * heightRatio, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // '가전 제어' 텍스트와 뒤로 가기 버튼
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * widthRatio, 0, 16 * widthRatio, 30 * heightRatio),
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
                                fontSize: 40 * widthRatio,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, isTvOn); // 상태를 전달하며 뒤로가기
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFD983),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              width: 135 * widthRatio,
                              height: 60 * heightRatio,
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 30 * widthRatio,
                                      height: 30 * heightRatio,
                                      child: SvgPicture.asset(
                                        'assets/vectors/group_4_x2.svg',
                                      ),
                                    ),
                                    SizedBox(width: 8 * widthRatio),
                                    Text(
                                      '뒤로',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20 * widthRatio,
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
                  // TV 상태 텍스트
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * widthRatio, 0, 16 * widthRatio, 20 * heightRatio),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.fromLTRB(0, 0, 13 * widthRatio, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/tv.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 55 * widthRatio,
                                height: 44 * heightRatio,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0, 7.5 * heightRatio, 0, 7.5 * heightRatio),
                            child: Text(
                              isTvOn ? 'TV가 켜져있어요' : 'TV가 꺼져있어요',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 25 * widthRatio,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 0xFFCCD6DD 색 리모컨 추가 및 여유 공간 생성
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        23 * widthRatio, 0, 19 * widthRatio, 7 * heightRatio),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFCCD6DD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            25 * widthRatio,
                            30 * heightRatio, // 여유 공간 추가
                            25 * widthRatio,
                            20 * heightRatio),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // TV 전원 버튼 추가 (크기 확대)
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: _toggleTvPower,
                                child: Container(
                                  width: 50 * widthRatio, // 크기 확대
                                  height: 50 * heightRatio, // 크기 확대
                                  child: SvgPicture.asset(
                                    isTvOn
                                        ? 'assets/vectors/vector_81_x2.svg'
                                        : 'assets/vectors/vector_69_x2.svg',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  2 * widthRatio,
                                  20 * heightRatio,
                                  2 * widthRatio,
                                  15 * heightRatio), // 패딩을 줄여서 컨텐츠를 위로 이동
                              width: 257 * widthRatio,
                              height: 50 * heightRatio, // 높이 감소
                              child: SizedBox(
                                width: 257 * widthRatio,
                                height: 37.6 * heightRatio,
                                child: SvgPicture.asset(
                                  'assets/vectors/frame_8_x2.svg',
                                ),
                              ),
                            ),
                            // 12개의 버튼을 동일한 크기와 간격으로 배치 (살짝 튀어나오게)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 8 * heightRatio), // 간격 조정
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (int j = 1; j <= 3; j++)
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: (j != 1)
                                                      ? 11 * widthRatio
                                                      : 0),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF777777),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        10.8 * heightRatio),
                                                child: Center(
                                                  child: Text(
                                                    _getButtonText(
                                                        i * 3 + j), // 버튼 텍스트 수정
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20 * widthRatio,
                                                      color: Color(0xFFFFFFFF),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // 하단 바
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x66D9D9D9),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15 * heightRatio),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, isTvOn); // 상태를 전달하며 뒤로가기
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
                                Navigator.pop(context, isTvOn); // 상태를 전달하며 뒤로가기
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
                                Navigator.pop(context, isTvOn); // 상태를 전달하며 뒤로가기
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 텍스트를 수정하는 함수
  String _getButtonText(int index) {
    switch (index) {
      case 10:
        return '이전';
      case 11:
        return '0';
      case 12:
        return '다음';
      default:
        return '$index';
    }
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
          width: 40 * widthRatio, // SVG의 크기를 조정하여 오버플로우 문제 해결
          height: 40 * heightRatio, // SVG의 크기를 조정하여 오버플로우 문제 해결
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
            fontSize: 18 * widthRatio,
            color: isSelected ? Color(0xFF000000) : Color(0xCC777777),
          ),
        ),
      ],
    );
  }
}
