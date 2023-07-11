import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/data/question_data.dart';
import 'package:quizzler/screen/congratulations.dart';

class HomeScreenController extends GetxController {
  QuestionData questionData = QuestionData();
  RxInt questionNumber = 0.obs;
  RxInt correctAnswer = 0.obs;
  RxInt incorrectAnswer = 0.obs;
  RxBool checkAnswer = true.obs;

  RxList<Icon> iconList = <Icon>[].obs;
  late Icon icon;

  getValue(bool value) {
    if (questionData.answer[questionNumber.value] == value) {
      correctAnswer.value++;
      checkAnswer.value = true;
      icon = const Icon(Icons.check, color: greenColor);
    } else {
      checkAnswer.value = false;
      incorrectAnswer.value++;
      icon = const Icon(Icons.close, color: redColor);
    }
    iconList.add(icon);
    questionNumber.value++;
  }

  valueLimitValidation() async {
    if (questionNumber.value == questionData.questionList.length) {
      questionNumber.value = 0;
      iconList.clear();
      await Get.offAll(Congratulations());
    }
  }

  getString() {
    return questionData.questionList[questionNumber.value];
  }
}
