import 'dart:math';

import 'package:flutter/material.dart';

class YesNoNotice extends StatefulWidget{                     //stateful界面的模板

final bool _isCorrect;                                             //构造函数和变量在这里定义  这个函数才是对外的接口，但是下面的却是主要内容。 
final VoidCallback _onTap;              //没有返回值，没有参数


YesNoNotice(this._isCorrect,this._onTap);                                               //根据构造函数的参数决定输出什么
 @override
 State createState()=>new YesNoNoticeState(); 
}
 
class YesNoNoticeState extends State<YesNoNotice> with SingleTickerProviderStateMixin{       //因为要创建动画，后面有一长串那个
Animation<double> _iconAnimation;
AnimationController _iconAnimationController; 
@override
void initState(){
  super.initState();
  _iconAnimationController=new AnimationController(duration: new Duration(seconds: 2),vsync:this);
  _iconAnimation=new CurvedAnimation(parent: _iconAnimationController,curve: Curves.elasticOut);
  _iconAnimation.addListener(()=>this.setState((){}));                      //？？？***这个添加监视器的过程我看不懂。。。
  _iconAnimationController.forward();    //*****启动动画？
}

 @override 
 Widget build(BuildContext context){                     //以下的层次可以在左侧的层次！
  
   return new Material(                                            //!!!!注意return的存在
          color: Colors.black54,
          child: InkWell(                                       //material的child，inkwell
            onTap:()=>widget._onTap() ,                       //*****!!!!!回调函数！！！！ */
            child:new Column(                                        //material的cnild，column
              mainAxisAlignment: MainAxisAlignment.center,               //column的属性 居中
              children: <Widget>[                                        //column的children
                new Container(                                                                //使用container可以便于添加边框之类的
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent[100],
                    shape:BoxShape.circle),
                  child:new Transform.rotate(      //？？？旋转组件，绕中心旋转，太秀了
                    angle: _iconAnimation.value*4*pi,                  //****？？？2pi就是两圈，但是这个组建是干啥的。。。
                    child:new Icon(widget._isCorrect==true?Icons.done:Icons.cancel,size:_iconAnimation.value*100,color: Colors.redAccent), 
                     //***新的icon组件  这里的图标是google提供的*/ 同时这里也要有动画，所以要放在这个里。     
                  ) ,                                 
                ),
                new Padding(
                  padding: EdgeInsets.only(top:20),                //图标和文字之间加入一段空隙，注意这个比较奇怪的操作
                ),
                new Text(widget._isCorrect==true?'Correct':'Wrong!',style:TextStyle(color:Colors.redAccent,fontSize: 80.0,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold))
                        //******为什么要有widget呢？？？？
              ],

            )
          ),
   );

 }
} 