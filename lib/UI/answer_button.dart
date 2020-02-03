import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget{
bool answer;
VoidCallback _onTap;        //******签名？？什么鬼
AnswerButton(this.answer,this._onTap);   //构造函数，决定按钮时什么颜色的。onTap如果按按钮就执行后面的:

  Widget build(BuildContext context){
    return new Expanded(          //****一般情况下控件要占用尽可能大的空间，但是column占用尽可能小的空间 
                // 所以要让它扩大，用expanded
                  child: new Material(       //这就是那个有着炫酷点击效果的墨水快！
                  color: answer==true?Colors.greenAccent:Colors.pinkAccent,    //true按键的颜色 三元运算符
                  child: new InkWell(
                    // onTap: ()=>print(answer==true?'u answered true':'u answered false'),
                    onTap:()=>_onTap(),   //！！！！！！！
                    child: new Center(
                      child: new Container(        //为什么用countair？？？？  A：为了能够给它边框！就是个容器！
                       decoration: BoxDecoration(
                        //  color: Colors.yellow,           //整个容器的背景色是什么
                        border:Border.all(color: Colors.white,     // 边框的颜色
                        width: 5.0,        //边框线的宽度
                        ),
                        borderRadius:BorderRadius.circular(25.0) 
                        ),    
                      padding: EdgeInsets.all(20.0),      //*****!!padding居然需要这么设置 */

                        child: new Text(answer==true?'True':'False',
                        style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                      ),
                    ),


                  ),         

                )      //Materail是一个颜色块**********,
                );
  }
}