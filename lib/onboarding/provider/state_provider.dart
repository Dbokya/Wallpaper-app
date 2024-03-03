import 'package:flutter/material.dart';
import 'package:wallpaper_app/onboarding/model/data_model.dart';

class OnboardingProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }

  ///onboarding data
  final onboardingData = [
    OnboardingDataModel(
        image: ImagePathModel(
            imagePath:
                'https://cdn.dribbble.com/userupload/9108681/file/original-1a05754021830692742e231b3d9417a9.png?resize=752x',
            isAsset: false),
        title: 'Ultimate Platform for seamlessly integrated onboarding'),
    OnboardingDataModel(
        image: ImagePathModel(
            imagePath:
                'https://cdn.dribbble.com/userupload/9108687/file/original-f5d0a7a5c833c990c9b4b61f9db94849.png?resize=752x',
            isAsset: false),
        title: 'Platform for seamlessly integrated onboarding'),
    OnboardingDataModel(
        image: ImagePathModel(
            imagePath:
                'https://cdn.dribbble.com/userupload/9108686/file/original-6a2e3407a986bfebc1d0072c610c0f48.png?resize=752x',
            isAsset: false),
        title: 'Platform for seamlessly onboarding'),
  ];
}
