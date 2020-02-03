import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/question_text.dart';
import '../UI/answer_button.dart';       //按钮UI控件
import '../UI/notice.dart';     //回答后的弹窗控件
import '../pages/score_pade.dart';

class QuizPage extends StatefulWidget{      //这是一个有状态的页面了！
State createState()=>new QuizPageState();   //??******实例化状态？？？？
// 建立了和下面的关系
}

class  QuizPageState extends State<QuizPage>{             //界面需要一个状态（state）
  Question currentQuestion;
  Quiz quiz=new Quiz([                            //新建一个问题列表
     new Question("Zodiac is a cool guy?", true),
     new Question('Elon Mask is human', false),
     new  Question('GaGa is a fucking Genius', true)
  ]
  );           

 
  String questionText;       //定义三个变量 问题的题目，序列，是否正确
  int questionNumber;
  bool isCorrect;
  bool YesNoNoticeVisible=false;       //*****正确错误提示不应该在一开始就显示出来 */

 @override
 void initState(){                         //*****init 初始化 这个就是初始化状态，每次更新都要初始化其中的东西
   super.initState();
   currentQuestion=quiz.nextQuestion;      //初始化变量
   questionText=currentQuestion.question;
   questionNumber=quiz.questionNumber;
 }

 void handleAnswer(bool answer){                //创建一个方法，用于抓取用户的点击的按钮，并且判断是否回答正确
   isCorrect=(currentQuestion.answer==answer);     //判断问题的答案是否和用户输入的一致
   quiz.answer(isCorrect);                      //如果是正确的就分数加一！
   this.setState((){                            //****?????改变了状态 ，去显示提示界面*/
     YesNoNoticeVisible=true;
   });
}


  Widget build(BuildContext context) {    //??***这是什么东西呢？
      return new Stack(     //stack让很多块块累计在一起     后面的组件显示在前面组件的上方
        fit: StackFit.expand,    //让控件填满屏幕
        children: <Widget>[
          new Column(    //列排布组件，它有很多属性。这个是主页面
              children: <Widget>[        //列排布的属性之一就是组件的排布
               new AnswerButton(true,(){handleAnswer(true);}),     //********！！！！！ontap, “如果按这个的话就执行后面的步骤”
               
              // 这里原来是很多的代码，但是为了简洁把它移动到了外边
               new QuestionText(questionText,questionNumber),         //****显示问题的方块 */
               new AnswerButton(false,(){handleAnswer(false);}),   
                 //*****这两行代码原来写了很多，但是这两个按钮是相似的，所以可以用一种UI控件来表示
                // 也就是answer_button里的东西 */
              ]
                            
          ) ,      
          YesNoNoticeVisible==true? new YesNoNotice(
            isCorrect,
            (){         //!!!*****!参数里面有一个回调函数，也就是善后处理措施。比如这里的更新题目序号，使界面消失等
                if(quiz.length==questionNumber){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new ScorePage(quiz.score, quiz.length)));
                  return;       //******！！！！！！如果所有题目都答完了就进入分数阶结算界面
                }
                currentQuestion=quiz.nextQuestion;
                this.setState((){
                  YesNoNoticeVisible=false;            //！！！***逻辑比较奇妙，多多注意   
                  questionText=currentQuestion.question;     //!!!【重要】当点击提示界面的时候，问题应该改变！
                  questionNumber=quiz.questionNumber;
                });

            }
          ):new Container()       //显示答案对错的界面.******其中的visible变量控制是否显示，因为一开始这个界面肯定是不显示的
        ],



      );
  }         
}