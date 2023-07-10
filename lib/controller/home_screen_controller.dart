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
          ? Icon(Icons.check, color: greenColor)
          : Icon(Icons.close, color: redColor);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      questionController.checkAnswer.value = false;
      questionController.incorrectAnswer.value++;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: greenColor)
          : Icon(Icons.close, color: redColor);
      iconList.add(icon);
      //print('InCorrect${question.incorrectAnswer.value}');
    }
    // if (questionController.questionNumber.value ==
    //     questionData.questionList.length) {
    //   print("Hi it is in the last index");
    //   print(questionData.questionList.length);
    //   return Get.offAll(Congratulations());
    //   //questionController.questionNumber.value = 0;
    // }

    if (questionController.questionNumber.value ==
        questionData.questionList.length) {
      Get.off(Congratulations());
    } else {
      questionController.questionNumber.value++;
    }

    print(questionController.questionNumber.value + 1);
    print(questionData.questionList.length);

    //  print('You Clicked the True Button');
    // else
  }

  // trueValue() {
  //   if (questionController.questionNumber.value >=
  //       questionData.questionList.length) {
  //     // Prevent further execution if all questions have been answered
  //     return;
  //   }

  //   if (questionData.answer[questionController.questionNumber.value] == true) {
  //     questionController.correctAnswer.value++;
  //     questionController.checkAnswer.value = true;
  //     icon = questionController.checkAnswer.value
  //         ? Icon(Icons.check, color: greenColor)
  //         : Icon(Icons.close, color: redColor);
  //     iconList.add(icon);
  //     //print('Correct${question.correctAnswer.value}');
  //   } else {
  //     questionController.checkAnswer.value = false;
  //     questionController.incorrectAnswer.value++;
  //     icon = questionController.checkAnswer.value
  //         ? Icon(Icons.check, color: greenColor)
  //         : Icon(Icons.close, color: redColor);
  //     iconList.add(icon);
  //     //print('InCorrect${question.incorrectAnswer.value}');
  //   }

  //   questionController.questionNumber.value++;

  //   if (questionController.questionNumber.value ==
  //       questionData.questionList.length) {
  //     Get.offAll(Congratulations());
  //   }
  // }

  falseValue() {
    if (questionData.answer[questionController.questionNumber.value] == false) {
      questionController.correctAnswer.value++;
      questionController.checkAnswer.value = true;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: greenColor)
          : Icon(Icons.close, color: redColor);
      iconList.add(icon);
      //print('Correct${question.correctAnswer.value}');
    } else {
      questionController.incorrectAnswer.value++;
      questionController.checkAnswer.value = false;
      icon = questionController.checkAnswer.value
          ? Icon(Icons.check, color: greenColor)
          : Icon(Icons.close, color: redColor);
      iconList.add(icon);
    }
    questionController.questionNumber.value++;
    //print('You Clicked the False Button');
    if (questionController.questionNumber.value ==
        questionData.questionList.length) {
      Get.offAll(Congratulations());
      //questionController.questionNumber.value = 0;
      checkListValue();
    }
  }
}
