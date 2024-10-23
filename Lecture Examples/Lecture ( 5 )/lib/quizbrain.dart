import 'qustions.dart';

class QuizBrain
{
     int _qustionNumber = 0;
     List<Questions> qustionBrain = [
    Questions('The black box in a plane is black', false),
    Questions('Marrakesh is the capital of Morocco', false),
    Questions( 'An octopus has three hearts', true),
    Questions('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false)
  ];


  void nextQuestion ()
  {
    if (_qustionNumber <qustionBrain.length-1)
      {
        _qustionNumber++;
      }
  }

  bool EndofQuiz ()
  {
    if(_qustionNumber <qustionBrain.length-1)
    {
     return true;
    }
    else
    {
      return false;
    }
  }
  String GetQuestion()
  {
    return qustionBrain[_qustionNumber].questionText;
  }
  bool GetAnswers()
  {
    return qustionBrain[_qustionNumber].answersText;
  }
  void resetQ()
  {
    _qustionNumber=0;
  }
}