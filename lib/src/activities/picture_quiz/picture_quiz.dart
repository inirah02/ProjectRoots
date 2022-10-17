import 'package:flutter/material.dart';
import 'package:projectroots/src/activities/picture_quiz/answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Project Roots Picture Quiz',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    if (_scoreTracker.length == 0)
                      SizedBox(
                        height: 25.0,
                      ),
                    if (_scoreTracker.length > 0) ..._scoreTracker
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 130.0,
                  margin:
                      EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      _questions[_questionIndex]['question'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map(
                  (answer) => Answer(
                    isImage: answer.containsKey('answerImage'),
                    answerText: (answer.containsKey('answerText')
                        ? answer['answerText']
                        : answer['answerImage']) as String,
                    answerColor: answerWasSelected
                        ? (answer['score'] as bool)
                            ? Colors.green
                            : Colors.red
                        : null,
                    answerTap: () {
                      // if answer was already selected then nothing happens onTap
                      if (answerWasSelected) {
                        return;
                      }
                      //answer is being selected
                      _questionAnswered((answer['score'] as bool));
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    if (!answerWasSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Please select an answer before going to the next question'),
                      ));
                      return;
                    }
                    _nextQuestion();
                  },
                  child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '${_totalScore.toString()}/${_questions.length}',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
                if (answerWasSelected && !endOfQuiz)
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: correctAnswerSelected ? Colors.green : Colors.red,
                    child: Center(
                      child: Text(
                        correctAnswerSelected
                            ? 'Well done, you got it right!'
                            : 'Oops! That was wrong! :/',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (endOfQuiz)
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        _totalScore > 4
                            ? 'Congratulations! Your final score is: $_totalScore'
                            : 'Your final score is: $_totalScore. Better luck next time!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: _totalScore > 4 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}

final _questions = const [
  {
    'question': 'What is the name of your eldest daughter?',
    'answers': [
      {'answerText': 'Anania', 'score': true},
      {'answerText': 'Rachna', 'score': false},
      {'answerText': 'Deepika', 'score': false},
    ],
  },
  {
    'question': 'Which of the following is your house?',
    'answers': [
      {'answerImage': '1.png', 'score': false},
      {'answerImage': '2.png', 'score': false},
      {'answerImage': '3.png', 'score': true},
    ],
  },
  {
    'question': 'Which of the following is your mobile phone?',
    'answers': [
      {'answerImage': 'phone1', 'score': false},
      {'answerImage': 'phone2', 'score': false},
      {'answerImage': 'phone3', 'score': true},
    ],
  },
  {
    'question': 'Who is your spouse?',
    'answers': [
      {'answerText': 'sample1', 'score': false},
      {'answerText': 'sample2', 'score': true},
      {'answerText': 'sample3', 'score': false},
    ],
  },
  {
    'question':
        'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'In which country are Panama hats made?',
    'answers': [
      {'answerText': 'Ecuador', 'score': true},
      {'answerText': 'Panama (duh)', 'score': false},
      {'answerText': 'Portugal', 'score': false},
    ],
  },
  {
    'question': 'From which country do French fries originate?',
    'answers': [
      {'answerText': 'Belgium', 'score': true},
      {'answerText': 'France (duh)', 'score': false},
      {'answerText': 'Switzerland', 'score': false},
    ],
  },
  {
    'question': 'Which sea creature has three hearts?',
    'answers': [
      {'answerText': 'Great White Sharks', 'score': false},
      {'answerText': 'Killer Whales', 'score': false},
      {'answerText': 'The Octopus', 'score': true},
    ],
  },
  {
    'question': 'Which European country eats the most chocolate per capita?',
    'answers': [
      {'answerText': 'Belgium', 'score': false},
      {'answerText': 'The Netherlands', 'score': false},
      {'answerText': 'Switzerland', 'score': true},
    ],
  },
];
