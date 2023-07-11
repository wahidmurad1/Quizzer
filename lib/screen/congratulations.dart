import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/const/styles.dart';
import 'package:quizzler/const/text.dart';
import 'package:quizzler/controller/home_screen_controller.dart';
import 'package:quizzler/data/question_data.dart';
import 'package:quizzler/screen/home_screen.dart';
import 'package:quizzler/const/congratulation_text.dart';
import 'package:quizzler/widgets/custom_button.dart';

class Congratulations extends StatelessWidget {
  Congratulations({super.key});
  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();
  final QuestionData questionData = QuestionData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CongratulationText(),
            Text(
              '$score ${homeScreenController.correctAnswer.value}/${questionData.questionList.length}',
              style: textStyles,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                titleText: restartButtonText,
                color: greenColor,
                onPressed: () {
                  homeScreenController.correctAnswer.value = 0;
                  Get.offAll(HomeScreen());
                }),
          ],
        ),
      ),
    );
  }
}
