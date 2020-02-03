import 'package:flutter/material.dart';
import 'package:flutter_app003/pages/quiz_page.dart';

class  QuestionText extends StatefulWidget{           //**********这是可变状态组件的标准模板，逻辑需要搞清楚！
  final String _question;
  final int _questionNumber;
  QuestionText(this._question,this._questionNumber);

      State createState()=>new QuestionTextState();   //为什么是这个样子？？
}

class  QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{    //********要做动画就要加一个长得吓人的单词 尼玛 */
Animation<double> _fontSizeAnimation;               //！！！！！创建一个动画变量   （居然还是double型的？）
var _fontSizeAnimationController;                  //！！！！！创建一个动画控制器,这先定义了一下，可以写类型名，也可以不写。比如第一个写了，第二个没写。下面会具体实例化，用类


@override     //下面这一段是创建一个字体变化动画的过程
void initState(){
    super.initState();        //*****？？？？这重写是什么鸡掰？？？？？  我知道重写是父子类之间的，但是为什么他要重写自己?
    _fontSizeAnimationController=new AnimationController(    //*******??????上面不是已经定义过一次了吗??    答，这是一个animationconllor类型的方法，实例化。上面只是定义*/
           duration: new Duration(milliseconds: 500),      //设置动画持续时间
           vsync: this      //????***什么东西？官方说法：处理屏幕之外的动画
    );     
    _fontSizeAnimation=new CurvedAnimation(parent: _fontSizeAnimationController,curve: Curves.fastOutSlowIn);      //******实例化一个线性动画 */
    _fontSizeAnimation.addListener(()=>this.setState((){})) ;  //????添加监视器，这是什么东西？？？？
    _fontSizeAnimationController.forward();      //实现方法
}

@override
void didUpdateWidget(QuestionText oldWidget)      //*****？？？？？每次需要更新组件的时候调用，对比一下新旧组件，如果不同就要重新开启组件
{
  super.didUpdateWidget(oldWidget);
     if(oldWidget._question!=widget._question){     
       _fontSizeAnimationController.reset();      //重置动画效果
       _fontSizeAnimationController.forward();    //重新开始动画效果
     }
}                                                           //【解释】以上这一+堆是为了解决：点击提示界面消失之后再次出现问题时，文本的动画会消失。


@override
  Widget build(BuildContext context){
    return new Material(

                 color: Colors.white,

               child: new Padding(     //padding组件      *******这一部分很有趣！padding当作一个组件了！！！！！！********
                   padding: EdgeInsets.symmetric(vertical: 20.0),     //????***为什么不用之前用的all了？因为all是四边都有距离，symmetric只是上下有距离，左右 没有距离。
                   child:new Center(
                     child: new Text('Question '+widget._questionNumber.toString()+': '+widget._question,   //*****为什么要加widget？？！ 
                     style:new TextStyle(fontSize: _fontSizeAnimation.value*15)),         //*****添加一个字体变化动画。   这个animationvalue默认是0.....1，想要变化的话就乘一个数     
                 ) , 
                )

               );
  }
}

