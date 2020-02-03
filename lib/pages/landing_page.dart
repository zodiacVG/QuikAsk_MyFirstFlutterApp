import 'package:flutter/material.dart';
import './quiz_page.dart';     //需要导航至的界面
class LandingPage extends StatelessWidget{    //定义一个类 stateless这个类是静止的
  // @override //????
  Widget build(BuildContext context){     //这一步是？？创建一个widget吗？
  // context是什么呢？
  // app点击一个按钮进入一个新的界面，也要保存你是在哪个屏幕跳过来的等等信息，以便你点击返回的时候能正确跳回，如果不存肯定就无法正确跳回了。
    return new Material(
      color: Colors.blueAccent,    //set the background :blue!
      child:new InkWell(                //******波纹button!  一整块的界面，可以显示东西（下面的child），也可以触控！
            onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new QuizPage())),    //*****！！！！导航，到底是什么东西？
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,    //*******y轴居中，可以指定对齐方式
           children: <Widget>[      //<>里的意思，和vector<>的意思一样，就是指这一系列东西是什么类型的.这里指每一个list项目都是widget类型的
              new Text('Quick Ask',style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight:FontWeight.bold ),),     //text类型 控件   style类似于html 但是结构比较复杂
             new Text('Powered by Zodiac',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
            
           ],    //list类型
         ),        //嵌套，把新组件添加进来
      )
    );
  }

}