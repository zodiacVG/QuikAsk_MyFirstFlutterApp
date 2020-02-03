import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_pade.dart';
void main(){
  runApp(new MaterialApp(   //创建一个material模式app
    home:new LandingPage(),   //首页是 landingpae界面
  ));
}