import 'package:flutter/material.dart';
import 'package:quizzler/const/colors.dart';
import 'package:quizzler/const/styles.dart';
import 'package:quizzler/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:quizzler/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();
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
                      homeScreenController.getString(),
                      style: textStyles,
                    ),
                  ),
                )),
            Expanded(
              child: CustomButton(
                  titleText: 'True',
                  color: greenColor,
                  onPressed: () {
                    homeScreenController.getValue(true);
                    homeScreenController.valueLimitValidation();
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
                    homeScreenController.getValue(false);
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
