import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

main() {
  test('100% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3",
        points: 10);
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5",
        points: 50);

    Answer person1 = Answer(question: q1, answerChoice: "3");
    Answer person2 = Answer(question: q2, answerChoice: "5");

    Quiz quiz1 = Quiz(questions: [q1, q2]);
    Player player = Player(name: "person1");
    player.SubnmitAnswer.add(person1);
    player.SubnmitAnswer.add(person2);
    quiz1.addPlayer(player);
    expect(player.calculatePercentage(quiz1.questions).toInt(), equals(100));
  });

  test('50% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3",
        points: 10);
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5",
        points: 50);

    Answer person1 = Answer(question: q1, answerChoice: "3");
    Answer person2 = Answer(question: q2, answerChoice: "7");

    Quiz quiz1 = Quiz(questions: [q1, q2]);
    Player player = Player(name: "Person2");
    player.SubnmitAnswer.add(person1);
    player.SubnmitAnswer.add(person2);
    quiz1.addPlayer(player);
    expect(player.calculatePercentage(quiz1.questions).toInt(), equals(50));
  });

  test('Player gets 0% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3",
        points: 10);
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5",
        points: 50);

    Answer person1 = Answer(question: q1, answerChoice: "1");
    Answer person2 = Answer(question: q2, answerChoice: "9");

    Quiz quiz2 = Quiz(questions: [q1, q2]);
    Player player = Player(name: "person3");
    player.SubnmitAnswer.add(person1);
    player.SubnmitAnswer.add(person2);
    expect(player.calculatePercentage(quiz2.questions), equals(0));
  });
}
