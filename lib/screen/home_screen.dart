import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/const/styles.dart';
import 'package:quizzler/data/question_data.dart';
import 'package:quizzler/screen/congratulations.dart';
import 'package:quizzler/widgets/custom_button.dart';
import 'package:quizzler/controller/question_controller.dart';
import 'package:get/get.dart';
import 'package:quizzler/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  QuestionController questionController = Get.put(QuestionController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  QuestionData questionData = QuestionData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF272727),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      questionData.questionList[
                          questionController.questionNumber.value],
                      style: textStyles,
                    ),
                  ),
                )),
            Expanded(
              child: CustomButton(
                  titleText: 'True',
                  color: greenColor,
                  onPressed: () {
                    homeScreenController.trueValue();
                    homeScreenController.valueLimitValidation();
                    // if (questionController.questionNumber.value ==
                    //     questionData.questionList.length) {
                    //   Get.offAll(Congratulations());
                    // }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomButton(
                  titleText: 'False',
                  color: redColor,
                  onPressed: () {
                    homeScreenController.falseValue();
                    homeScreenController.valueLimitValidation();
                  }),
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  child: SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: homeScreenController.iconList,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
