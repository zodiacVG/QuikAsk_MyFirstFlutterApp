import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {             //静态界面
    
    final int score;
    final int totalQuestions;                     //以上这两个用于显示分数

    ScorePage(this.score,this.totalQuestions);

    Widget build(BuildContext context){
      return new Material(
        color:Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[              //！！！！！！子控件
                new Text('Your Score:',style: new TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 40.0),),
                new Text(score.toString()+'/'+totalQuestions.toString(),style: new TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 50.0),),
                new IconButton(
                  icon:new Icon(Icons.fingerprint),
                  color:Colors.cyanAccent,
                  iconSize: 50.0,
                  onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new LandingPage())),    //score.toString()+'/'+totalQuestions.toString()
                ),
                new Text('restart',style:new TextStyle(fontSize:30.0,fontWeight: FontWeight.bold,color: Colors.white))
          ],
        ),
      );
    }
}