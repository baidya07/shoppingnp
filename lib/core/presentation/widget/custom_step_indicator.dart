import 'package:flutter/material.dart';

import '../resources/colors.dart';

class CustomStepProgressBar extends StatelessWidget {
  // final List<String> stepperList = ['Cart','Shipping', 'Payment', 'Preview'];
  final List<String> stepperList = ['Cart','Shipping', 'Preview'];

  CustomStepProgressBar({
    Key? key,
    required this.currentStep,
  }) : super(key: key);

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final activeStep = currentStep - 1;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(stepperList.length, (i) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60.0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      width: 24,
                      height: 24,
                      child: Container(
                        // curve: Curves.fastOutSlowIn,
                        // duration: kThemeAnimationDuration,
                        decoration: BoxDecoration(
                          color: i <= activeStep
                              ? Theme.of(context).primaryColor
                              : null,
                          border: Border.all(width: 3, color: primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: _buildCircleChild(
                              i,
                              stepperList.length,
                              activeStep,
                              i <= activeStep
                                  ? StepState.complete
                                  : StepState.indexed),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsetsDirectional.only(start: 12.0),
                    child: Text(
                      stepperList.elementAt(i),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.apply(color: primaryColor, fontWeightDelta: 1),
                    ),
                  ),
                ],
              ),
              if (stepperList.length - 1 != i)
                Container(
                  height: 1.0,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.black,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCircleChild(
      int index, int totalSteps, int currentStep, StepState state) {
    switch (state) {
      case StepState.indexed:
      case StepState.disabled:
        return Text(
          '${index + 1}',
          style: TextStyle(
              color: index <= currentStep ? Colors.white : primaryColor),
        );
      case StepState.editing:
        return const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18.0,
        );
      case StepState.complete:
        return const Icon(
          Icons.check,
          color: Colors.white,
          size: 18.0,
        );
    }
  }
}

enum StepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a pencil icon in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,
}
