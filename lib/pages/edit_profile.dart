import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_user_login.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  bool _isEditing = false;
  String _selectedGender = ''; // 성별을 저장할 변수

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
      resizeToAvoidBottomInset: true, // 키보드가 나타날 때 자동으로 화면 크기를 조정
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight, // 전체 화면 높이 설정
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
                padding: EdgeInsets.fromLTRB(14 * widthRatio, 100 * heightRatio,
                    10 * widthRatio, 50 * heightRatio), // 전체 패딩 조정
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 10 * heightRatio), // 상단 마진 조정
                      child: Text(
                        '정보를 수정할게요!',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 30 * widthRatio,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 40 * heightRatio), // 아래 마진 조정
                      child: Text(
                        '혹시 다른 계정으로 변환하고 싶으세요?\n로그아웃 하시면 돼요!',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500, // 살짝 얇은 폰트 사용
                          fontSize: 20 * widthRatio,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 14 * heightRatio),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '성함이 어떻게 되세요?',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 25 * widthRatio,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 40 * heightRatio), // 하단 마진 조정
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 220 * widthRatio, // 탭의 길이를 늘림
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(12 * widthRatio),
                            color: Color(0xFFD9D9D9),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4 * heightRatio),
                                blurRadius: 2 * heightRatio,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 18 * widthRatio,
                              color: Color(0x99000000),
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(
                                  8 * widthRatio,
                                  11 * heightRatio,
                                  8.9 * widthRatio,
                                  11 * heightRatio),
                              hintText: _isEditing ? '' : '이쪽을 눌러 입력해주세요',
                              border: InputBorder.none,
                            ),
                            onTap: () {
                              setState(() {
                                _isEditing = true;
                              });
                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                _isEditing = false;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16 * heightRatio),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '성별이 어떻게 되시나요?',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 25 * widthRatio,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 180 * widthRatio,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildGenderButton(
                                '남자', 'assets/vectors/vector_4_x2.svg'),
                            SizedBox(width: 6 * widthRatio),
                            _buildGenderButton(
                                '여자', 'assets/vectors/vector_1_x2.svg'),
                          ],
                        ),
                      ),
                    ),
                    Spacer(), // 아래 여백을 확보하기 위해 Spacer 사용
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: _selectedGender.isNotEmpty &&
                                _nameController.text.isNotEmpty
                            ? () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        NewUserLogin(
                                      userName: _nameController.text,
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(15 * widthRatio),
                            color: _selectedGender.isNotEmpty &&
                                    _nameController.text.isNotEmpty
                                ? Color(0xFFFFBDA1)
                                : Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4 * heightRatio),
                                blurRadius: 2 * heightRatio,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              right: 10 * widthRatio, bottom: 20 * heightRatio),
                          padding: EdgeInsets.symmetric(
                              vertical: 10 * heightRatio,
                              horizontal: 20 * widthRatio),
                          child: Text(
                            '작성완료',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender; // 성별 저장
        });
      },
      child: Container(
        width: 87 * (MediaQuery.of(context).size.width / 360),
        height: 43 * (MediaQuery.of(context).size.height / 800),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              12 * (MediaQuery.of(context).size.width / 360)),
          color: _selectedGender == gender
              ? Color(0xFFD9D9D9).withOpacity(0.5)
              : Color(0xFFD9D9D9),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4 * (MediaQuery.of(context).size.height / 800)),
              blurRadius: 2 * (MediaQuery.of(context).size.height / 800),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 21.9 * (MediaQuery.of(context).size.width / 360),
            height: 39 * (MediaQuery.of(context).size.height / 800),
          ),
        ),
      ),
    );
  }
}
