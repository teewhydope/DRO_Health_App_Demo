import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepQuestion1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: Row(
          children: [
            Text('Step 1 of 6  '),
            Container(
              width: 180,
              child: StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
                size: 10,
                padding: 0,
                selectedColor: Color.fromRGBO(12, 184, 182, 1),
                unselectedColor: Colors.grey[350],
                roundedEdges: Radius.circular(10),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: Text(
          'What is your name?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}
