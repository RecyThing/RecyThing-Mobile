import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class ProgressStep extends StatefulWidget {
  const ProgressStep({super.key});

  @override
  State<ProgressStep> createState() => _ProgressStepState();
}

class _ProgressStepState extends State<ProgressStep> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  final dashImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
  ];

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      stepShape: StepShape.rRectangle,
      direction: Axis.vertical,
      stepBorderRadius: 15,
      borderThickness: 2,
      padding: const EdgeInsets.all(20),
      stepRadius: 28,
      finishedStepBorderColor: Colors.deepOrange,
      finishedStepTextColor: Colors.deepOrange,
      finishedStepBackgroundColor: Colors.deepOrange,
      activeStepIconColor: Colors.deepOrange,
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: Image.asset('assets/1.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 1',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Image.asset('assets/2.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 2',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Image.asset('assets/3.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 3',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 3 ? 1 : 0.3,
              child: Image.asset('assets/4.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 4',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 4 ? 1 : 0.3,
              child: Image.asset('assets/5.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 5',
            textAlign: TextAlign.center,
          ),
        ),
      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
