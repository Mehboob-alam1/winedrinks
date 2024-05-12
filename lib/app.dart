import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/utlis/constants/colors.dart';
import 'package:winedrinks/utlis/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: WAppTheme.lightTheme,
      darkTheme: WAppTheme.darkTheme,
      home: const Scaffold(backgroundColor: WColors.primary,body: Center(child: CircularProgressIndicator(color: WColors.white),),),

    );
  }
}
