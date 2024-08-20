import 'package:flutter/material.dart';

import 'package:flutter_app/pages/airclean_off.dart';
import 'package:flutter_app/pages/airclean_on.dart';
import 'package:flutter_app/pages/aircon_off.dart';
import 'package:flutter_app/pages/aircon_on.dart';
import 'package:flutter_app/pages/conversation.dart';
import 'package:flutter_app/pages/edit_profile.dart';
import 'package:flutter_app/pages/ex_user_one.dart';
import 'package:flutter_app/pages/ex_user_three.dart';
import 'package:flutter_app/pages/ex_user_two.dart';
import 'package:flutter_app/pages/aircon_off.dart';
import 'package:flutter_app/pages/aircon_on.dart';
import 'package:flutter_app/pages/faq.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/home_bookmark.dart';
import 'package:flutter_app/pages/home_bookmark_done.dart';
import 'package:flutter_app/pages/intro.dart';
import 'package:flutter_app/pages/iot.dart';
import 'package:flutter_app/pages/light_off.dart';
import 'package:flutter_app/pages/light_on.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/logout.dart';
import 'package:flutter_app/pages/new_user_in.dart';
import 'package:flutter_app/pages/new_user_login.dart';
import 'package:flutter_app/pages/setting.dart';
import 'package:flutter_app/pages/tv.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        body: Intro(),
      ),
    );
  }
}
