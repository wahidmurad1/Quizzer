import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/const/styles.dart';
import 'package:quizzler/const/text.dart';
import 'package:quizzler/controller/question_controller.dart';
import 'package:quizzler/data/question_data.dart';
import 'package:quizzler/screen/home_screen.dart';
import 'package:quizzler/widgets/custom_button.dart';

class Congratulations extends StatelessWidget {
  Congratulations({super.key});
  QuestionController questionController = Get.put(QuestionController());
  QuestionData questionData = QuestionData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Congratulations',
                style: congratsTextStyle,
                //textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You Finished Your Task Successfully',
              style: textStyles,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your Score is ${questionController.correctAnswer.value}/${questionData.questionList.length}',
              style: textStyles,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                titleText: 'ReStart',
                color: Colors.green,
                onPressed: () {
                  questionController.correctAnswer.value = 0;
                  Get.offAll(HomeScreen());
                }),
          ],
        ),
      ),
    );
  }
}
