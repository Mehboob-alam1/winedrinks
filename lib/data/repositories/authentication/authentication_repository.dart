import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winedrinks/features/authentication/screens/login/login.dart';
import 'package:winedrinks/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  /// variable
  final deviceStorage= GetStorage();



  /// called from main.dart on app launch
  @override
  void onReady() {
  FlutterNativeSplash.remove();
  screenRedirect();
  }



  /// Function to show Relevant screen

  screenRedirect() async{

    if(kDebugMode){
      print('==================== GET STORAGE AUTH REPO ==================');
      print(deviceStorage.read('isFirstTime'));
    }

    /// Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") !=true ?Get.offAll(() =>const LoginScreen()) :Get.offAll(()=>const OnBoardingScreen());
  }
}