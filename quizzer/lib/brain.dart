import 'question.dart';

class Brain{
    List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet', a: true),
    Question(q: 'A slug\'s blood is green', a: true)
  ];
    int questionNumber = 0;

    int getTotalQuestions(){
      return questionBank.length;
    }

    void nextQuestion(){
      if(questionNumber < questionBank.length-1){
        questionNumber++;
        print(questionNumber);
      }
      else{
        questionNumber++;

      }
    }

    bool isFinal(){
      if(questionNumber == questionBank.length){
                print('True');
        print(questionNumber);

        return true;
      }
      else{
                        print('False');
        print(questionNumber);
        return false;
      }
    }

    bool getCorrectAnswer(){
      return questionBank[questionNumber].questionAnswer;
    }
    
    String getText(){
      return questionBank[questionNumber].questionText;
    }
}