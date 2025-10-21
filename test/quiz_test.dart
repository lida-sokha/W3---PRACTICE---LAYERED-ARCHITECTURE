import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

main() {
  test('100% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3");
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5");

    Answer person1 = Answer(question: q1, answerChoice: "3");
    Answer person2 = Answer(question: q2, answerChoice: "5");

    Quiz quiz1 = Quiz(questions: [q1, q2]);
    quiz1.addAnswer(person1);
    quiz1.addAnswer(person2);
    expect(quiz1.getScoreInPercentage(), equals(100));
  });

  test('50% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3");
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5");

    Answer person1 = Answer(question: q1, answerChoice: "3");
    Answer person2 = Answer(question: q2, answerChoice: "7");

    Quiz quiz1 = Quiz(questions: [q1, q2]);
    quiz1.addAnswer(person1);
    quiz1.addAnswer(person2);
    expect(quiz1.getScoreInPercentage(), equals(50));
  });

    test('Player gets 0% score', () {
    Question q1 = Question(
        title: "Which number is the biggest number?",
        choices: ["1", "2", "3"],
        goodChoice: "3");
    Question q2 = Question(
        title: "Which number is the smallest number?",
        choices: ["5", "7", "9"],
        goodChoice: "5");

    Answer person1 = Answer(question: q1, answerChoice: "1");
    Answer person2 = Answer(question: q2, answerChoice: "9");

    Quiz quiz1 = Quiz(questions: [q1, q2]);
    quiz1.addAnswer(person1);
    quiz1.addAnswer(person2);
    expect(quiz1.getScoreInPercentage(), equals(0));
  });
}
