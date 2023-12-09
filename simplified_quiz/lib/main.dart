import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  List<String> _selectedOptions = [];
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Paris', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe'],
      'answer': 'Blue Whale',
    },
    {
      'question': 'What does CPU stand for?',
      'options': [
        'Central Processing Unit',
        'Computer Personal Unit',
        'Central Processor Unit'
      ],
      'answer': 'Central Processing Unit',
    },
    {
      'question':
          'Which programming language is known as the "mother of all languages"?',
      'options': ['C', 'Java', 'Assembly'],
      'answer': 'Assembly',
    },
    {
      'question': 'What does HTML stand for?',
      'options': [
        'Hyper Text Markup Language',
        'Hyperlinks and Text Markup Language',
        'Home Tool Markup Language'
      ],
      'answer': 'Hyper Text Markup Language',
    },
    // Add more questions as needed
  ];

  void _selectOption(String? option) {
    if (option != null) {
      setState(() {
        _selectedOptions.add(option);
        if (option == _questions[_questionIndex]['answer']) {
          _score++;
        }
        _questionIndex++;
        if (_questionIndex == _questions.length) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                score: _score,
                questions: _questions,
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_questionIndex + 1} of ${_questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              _questions[_questionIndex]['question'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Column(
              children:
                  _questions[_questionIndex]['options'].map<Widget>((option) {
                return RadioListTile<String?>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOptions.length > _questionIndex
                      ? _selectedOptions[_questionIndex]
                      : null,
                  onChanged: (String? value) => _selectOption(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final List<Map<String, dynamic>> questions;

  ResultScreen({required this.score, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your score: $score / ${questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              score == questions.length
                  ? 'Congratulations! You aced the quiz!'
                  : 'You did well, but you can do better!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Correct answers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children: questions.map<Widget>((question) {
                return ListTile(
                  title: Text(question['question']),
                  subtitle: Text(question['answer']),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
