//这个文件里的很重要，可以说是核心内容之一。理解里面这些东西为什么 要放在一起，理解面向对象编程的理念。
import 'question.dart';
class Quiz{
  List<Question> _questions;    //创建一个关于问题的list
  // 加下划线边为私有，注意dart没有private
  int _currentQuestionIndex=-1;    //目前第几个问题
  int _score=0;
  
  Quiz(this._questions){
    _questions.shuffle();       //构造函数 随机选取问题
  }
  
  List<Question> get questions=>_questions;
  int get score=>_score;      //* **get 很酷的做法，可以直接当作属性用  注意顺序*/   ******
  int get questionNumber=>_currentQuestionIndex+1;    
  int get numberofQuestions=>_questions.length;      //“用户可能想知道问题的数目“注意这种思想！ ******

Question get nextQuestion{                                //返回下一个问题
  _currentQuestionIndex++;
  if(_currentQuestionIndex>=questions.length)
  return null;
  else
  return _questions[_currentQuestionIndex];     //一直要加_还是很容易错的呢。。。
}

  int get length => _questions.length;

void answer(bool isCorrect){             //如果答对了，分数加一
  if(isCorrect) _score++;
}
}