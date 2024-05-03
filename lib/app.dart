import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/features/authentication/screens/onboarding/onboarding.dart';
import 'package:winedrinks/utlis/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: WAppTheme.lightTheme,
      darkTheme: WAppTheme.darkTheme,
      home: const OnBoardingScreen(),

    );
  }
}
