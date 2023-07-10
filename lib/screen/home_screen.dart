import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/const/custom_button.dart';
import 'package:quizzler/const/question.dart';
import 'package:get/get.dart';
import 'package:quizzler/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Question question = Get.put(Question());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF272727),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      // "This is the First Question?",
                      question.questionList[question.questionNumber.value],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )),
            Expanded(
              child: CustomButton(
                  titleText: 'True',
                  color: Colors.green,
                  onPressed: () {
                    homeScreenController.trueValue();
                    // if (question.answer[question.questionNumber.value] ==
                    //     true) {
                    //   question.correctAnswer.value++;
                    //   question.checkAnswer.value = true;
                    //   homeScreenController.icon = question.checkAnswer.value
                    //       ? Icon(Icons.check, color: Colors.green)
                    //       : Icon(Icons.close, color: Colors.red);
                    //   homeScreenController.iconList
                    //       .add(homeScreenController.icon);
                    //   //print('Correct${question.correctAnswer.value}');
                    // } else {
                    //   question.checkAnswer.value = false;
                    //   question.incorrectAnswer.value++;
                    //   homeScreenController.icon = question.checkAnswer.value
                    //       ? Icon(Icons.check, color: Colors.green)
                    //       : Icon(Icons.close, color: Colors.red);
                    //   homeScreenController.iconList
                    //       .add(homeScreenController.icon);
                    //   //print('InCorrect${question.incorrectAnswer.value}');
                    // }
                    // question.questionNumber.value++;
                    // //  print('You Clicked the True Button');
                    // if (question.questionNumber.value ==
                    //     question.questionList.length) {
                    //   question.questionNumber.value = 0;
                    // }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomButton(
                  titleText: 'False',
                  color: Colors.red,
                  onPressed: () {
                    homeScreenController.falseValue();
                    // if (question.answer[question.questionNumber.value] ==
                    //     false) {
                    //   question.correctAnswer.value++;
                    //   question.checkAnswer.value = true;
                    //   homeScreenController.icon = question.checkAnswer.value
                    //       ? Icon(Icons.check, color: Colors.green)
                    //       : Icon(Icons.close, color: Colors.red);
                    //   homeScreenController.iconList
                    //       .add(homeScreenController.icon);
                    //   //print('Correct${question.correctAnswer.value}');
                    // } else {
                    //   question.incorrectAnswer.value++;
                    //   question.checkAnswer.value = false;
                    //   // question.correctAnswer.value++;
                    //   // question.checkAnswer.value = true;
                    //   homeScreenController.icon = question.checkAnswer.value
                    //       ? Icon(Icons.check, color: Colors.green)
                    //       : Icon(Icons.close, color: Colors.red);
                    //   homeScreenController.iconList
                    //       .add(homeScreenController.icon);
                    //   //print('InCorrect${question.incorrectAnswer.value}');
                    // }
                    // question.questionNumber.value++;
                    // //print('You Clicked the False Button');
                    // if (question.questionNumber.value ==
                    //     question.questionList.length) {
                    //   question.questionNumber.value = 0;
                    //   homeScreenController.checkListValue();
                    // }
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
                      // children: [
                      //   ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: homeScreenController.iconList.length,
                      //       itemBuilder: (context, index) {
                      //         return Padding(
                      //           padding: EdgeInsets.all(8.0),
                      //           child: homeScreenController.iconList[index],
                      //         );
                      //       }),
                      // ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
