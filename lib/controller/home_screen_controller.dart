import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/controller/question_controller.dart';
import 'package:quizzler/data/question_data.dart';
import 'package:quizzler/screen/congratulations.dart';

class HomeScreenController extends GetxController {
  QuestionController questionController = Get.put(QuestionController());
  QuestionData questionData = Get.put(QuestionData());
  checkListValue() {
    if (questionController.questionNumber.value ==
        questionData.questionList.length) {
      //  Get.offAll(Congratulations());
      // print(questionController.questionNumber.value ==
      //     questionData.questionList.length),
    }
  }

  // RxList<Icon> iconList = [].obs;
  RxList<Icon> iconList = <Icon>[].obs;
  late Icon icon;

  trueValue() {
    if (questionData.answer[questionController.questionNumber.value] == true) {
      questionController.correctAnswer.value++;
      questionController.checkAnswer.value = true;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      questionController.checkAnswer.value = false;
      questionController.incorrectAnswer.value++;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('InCorrect${question.incorrectAnswer.value}');
    }
    questionController.questionNumber.value++;
    //  print('You Clicked the True Button');
    // if (questionController.questionNumber.value ==
    //     questionData.questionList.length) {
    //   questionController.questionNumber.value = 0;
    //   Get.offAll(Congratulations());
    // }
  }

  falseValue() {
    if (questionData.answer[questionController.questionNumber.value] == false) {
      questionController.correctAnswer.value++;
      questionController.checkAnswer.value = true;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      questionController.incorrectAnswer.value++;
      questionController.checkAnswer.value = false;
      // question.correctAnswer.value++;
      // question.checkAnswer.value = true;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      iconList.add(icon);
      //print('InCorrect${question.incorrectAnswer.value}');
    }
    questionController.questionNumber.value++;
    //print('You Clicked the False Button');
    // if (questionController.questionNumber.value ==
    //     questionData.questionList.length) {
    //   questionController.questionNumber.value = 0;
    //   checkListValue();
    // }
  }

  valueLimitValidation() async {
    if (questionController.questionNumber.value ==
        questionData.questionList.length) {
      questionController.questionNumber.value = 0;
      iconList.clear();
      await Get.offAll(Congratulations());
    }
  }
}
