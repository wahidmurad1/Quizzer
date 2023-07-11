import 'package:flutter/widgets.dart';
import 'package:quizzler/const/styles.dart';
import 'package:quizzler/const/text.dart';

class CongratulationText extends StatelessWidget {
  const CongratulationText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: Text(
            congratsText,
            style: congratsTextStyle,
            //textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          taskFinishedText,
          style: textStyles,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
