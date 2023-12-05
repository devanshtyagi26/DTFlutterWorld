import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Which planet is known as the "Red Planet"?',
      'answers': [
        {'text': 'Venus', 'score': 0},
        {'text': 'Mars', 'score': 10},
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Saturn', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the largest moon in our solar system?',
      'answers': [
        {'text': 'Titan', 'score': 0},
        {'text': 'Ganymede', 'score': 10},
        {'text': 'Europa', 'score': 0},
        {'text': 'Callisto', 'score': 0},
      ],
    },
    {
      'questionText': 'Who was the first human to walk on the moon?',
      'answers': [
        {'text': 'Neil Armstrong', 'score': 10},
        {'text': 'Buzz Aldrin', 'score': 0},
        {'text': 'Yuri Gagarin', 'score': 0},
        {'text': 'Alan Shepard', 'score': 0},
      ],
    },
    {
      'questionText': 'Which galaxy is our solar system part of?',
      'answers': [
        {'text': 'Andromeda', 'score': 0},
        {'text': 'Milky Way', 'score': 10},
        {'text': 'Triangulum', 'score': 0},
        {'text': 'Sombrero', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the name of the largest volcano on Mars?',
      'answers': [
        {'text': 'Mauna Loa', 'score': 0},
        {'text': 'Olympus Mons', 'score': 10},
        {'text': 'Mount Everest', 'score': 0},
        {'text': 'Mount St. Helens', 'score': 0},
      ],
    },
    {
      'questionText': 'Which space agency launched the Hubble Space Telescope?',
      'answers': [
        {'text': 'NASA', 'score': 10},
        {'text': 'ESA', 'score': 0},
        {'text': 'ISRO', 'score': 0},
        {'text': 'Roscosmos', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 227, 238),
      appBar: AppBar(
        title: Text(
          'Space Quiz',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? Quiz(
                questionText:
                    _questions[_questionIndex]['questionText'] as String,
                answers: _questions[_questionIndex]['answers']
                    as List<Map<String, Object>>,
                answerQuestion: _answerQuestion,
              )
            : Result(score: _score, resetQuiz: _resetQuiz),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ${(_questionIndex + 1).clamp(1, _questions.length)}/${_questions.length}',
                style: TextStyle(fontSize: 16),
              ),
              // Inside the BottomAppBar
              ElevatedButton(
                onPressed: _resetQuiz,
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                    color: const Color.fromARGB(
                        255, 254, 231, 21), // Your desired text color
                    fontSize: 13,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 16, 24, 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function(int) answerQuestion;

  Quiz({
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questionText),
        SizedBox(height: 20),
        ...(answers.map((answer) {
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'] as String);
        })).toList(),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          primary: const Color.fromARGB(255, 16, 24, 32),
        ),
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 24,
            color: const Color.fromARGB(255, 254, 231, 21),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  Result({required this.score, required this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Score: $score',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: resetQuiz,
          child: Text(
            'Restart Quiz',
            style: TextStyle(
              color: const Color.fromARGB(
                  255, 254, 231, 21), // Your desired text color
              fontSize: 13,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 16, 24, 32),
          ),
        ),
      ],
    );
  }
}
