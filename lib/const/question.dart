import 'package:get/get.dart';

class Question extends GetxController {
  // RxList<String> questionList = <String>[].obs;

  // List<String> question= [
  //   'Hi this is your First Question',
  //   'Hi this is your Second Question',
  //   'Hi this is your Third Question',
  //   'Hi this is your Fourth Question',
  //   'Hi this is your Fifth Question',
  // ];
  RxInt questionNumber = 0.obs;
  RxInt correctAnswer = 0.obs;
  RxInt incorrectAnswer = 0.obs;
  RxBool checkAnswer = true.obs;

  List<String> questionList = [
    'Hi this is your First Question',
    'Hi this is your Second Question',
    'Hi this is your Third Question',
    'Hi this is your Fourth Question',
    'Hi this is your Fifth Question',
  ];

  List<bool> answer = [false, true, true, false, true];
}
