import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winedrinks/features/authentication/screens/login/login.dart';
import 'package:winedrinks/features/authentication/screens/onboarding/onboarding.dart';
import 'package:winedrinks/utlis/exceptions/firebase_auth_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/firebase_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/format_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  /// variable
  final deviceStorage= GetStorage();
  final _auth = FirebaseAuth.instance;




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



  /// [Email Authentication]  - REGISTER

Future<UserCredential> registerWithEmailAndPassword(String email,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch (e){
      throw WFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw WFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const WFormatException();
    } on PlatformException catch (e){
      throw WPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong, Please try again';
    }
}
}