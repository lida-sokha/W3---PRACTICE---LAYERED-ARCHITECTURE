import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name:');
      String? name = stdin.readLineSync();

      if (name == null || name.trim().isEmpty) {
        quiz.showScore();
        break;
      }

      Player? existingPlayer = quiz.players.firstWhere(
        (p) => p.name.toLowerCase() == name.toLowerCase(),
        orElse: () => Player(name: name),
      );

      existingPlayer.SubnmitAnswer.clear();

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points})');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          existingPlayer.SubnmitAnswer.add(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      quiz.addAndUpdatePlayer(existingPlayer);

      int score = existingPlayer.calculatePercentage(quiz.questions).toInt();
      int totalscore = existingPlayer.calculateTotalScore();
      if (!quiz.players.contains(existingPlayer)) {
        quiz.addPlayer(existingPlayer);
      }

      ///total score
      print('--- Quiz Finished ---');
      print(
          '${existingPlayer.name}, your score in percentage: $score % correct');
      print('${existingPlayer.name}, your score in points: $totalscore');
    }
  }
}
