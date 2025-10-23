class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  ///defind the point
  int points;
  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.points = 1});

  /// default 1
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  List<Question> questions;
  // List<Answer> answers = [];
  List<Player> players = [];

  Quiz({required this.questions});

  void addPlayer(Player player) {
    this.players.add(player);
  }

  ///total point
  void showScore() {
    for (var p in players) {
      print('Player:${p.name} \t Score: ${p.calculateTotalScore()}');
    }
  }

  void addAndUpdatePlayer(Player player) {
    var existingPlayer = players.firstWhere(
      (p) => p.name.toLowerCase() == player.name.toLowerCase(),
      orElse: () => Player(name: ''),
    );
    if (existingPlayer.name.isEmpty) {
      players.add(player);
    } else {
       existingPlayer.SubnmitAnswer = List.from(player.SubnmitAnswer);


    // Recalculate total after adding
    int newScore = existingPlayer.calculateTotalScore();
    double newPercent = existingPlayer.calculatePercentage(questions);
     print(
        "Updated ${existingPlayer.name}'s total score: $newScore points (${newPercent.toInt()}%)");
    }
  }
}

class Player {
  String name;
  List<Answer> SubnmitAnswer = [];
  Player({required this.name});

  int calculateTotalScore() {
    int totalEarned = 0;
    for (var a in SubnmitAnswer) {
      if (a.isGood()) {
        totalEarned += a.question.points;
      }
    }
    return totalEarned;
  }

  double calculatePercentage(List<Question> questions) {
    int correct = 0;
    for (var a in SubnmitAnswer) {
      if (a.isGood()) correct++;
    }
    return (correct / questions.length) * 100;
  }
}
