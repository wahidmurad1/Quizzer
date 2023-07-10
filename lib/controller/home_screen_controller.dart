import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzler/const/question.dart';

class HomeScreenController extends GetxController {
  Question question = Get.put(Question());
  checkListValue() {
    if (question.questionNumber.value == question.questionList.length) {
      print(question.questionNumber.value == question.questionList.length);
      return Get.snackbar(
        'SnackBar Example',
        'Hello, SnackBar!',
        backgroundColor: Colors.grey[800],
        colorText: Colors.white,
      );
    }
  }

  // RxList<Icon> iconList = [].obs;
  RxList<Icon> iconList = <Icon>[].obs;
  late Icon icon;
  trueValue() {
    if (question.answer[question.questionNumber.value] == true) {
      question.correctAnswer.value++;
      question.checkAnswer.value = true;
      icon = question.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      question.checkAnswer.value = false;
      question.incorrectAnswer.value++;
      icon = question.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('InCorrect${question.incorrectAnswer.value}');
    }
    question.questionNumber.value++;
    //  print('You Clicked the True Button');
    if (question.questionNumber.value == question.questionList.length) {
      question.questionNumber.value = 0;
    }
  }

  falseValue() {
    if (question.answer[question.questionNumber.value] == false) {
      question.correctAnswer.value++;
      question.checkAnswer.value = true;
      icon = question.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      question.incorrectAnswer.value++;
      question.checkAnswer.value = false;
      // question.correctAnswer.value++;
      // question.checkAnswer.value = true;
      icon = question.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('InCorrect${question.incorrectAnswer.value}');
    }
    question.questionNumber.value++;
    //print('You Clicked the False Button');
    if (question.questionNumber.value == question.questionList.length) {
      question.questionNumber.value = 0;
      checkListValue();
    }
  }
}
